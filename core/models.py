from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
from django.conf import settings
from django.utils.encoding import smart_text
from django.db.models.signals import post_save
from django.core.validators import RegexValidator

# Create your models here.

"""
https://docs.djangoproject.com/en/3.0/topics/auth/customizing/
"""


class MyUserManager(BaseUserManager):
    def create_user(self, username, email, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            username=username,
            email=self.normalize_email(email),

        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, password):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            username,
            email,
            password=password,

        )

        user.is_admin = True
        user.is_staff = True
        user.save(using=self._db)
        return user


USERNAME_REGEX = '^[A-Za-z0-9]*$'


class MyUser(AbstractBaseUser):
    username = models.CharField(
        max_length=120,
        validators=[
            RegexValidator(
                regex=USERNAME_REGEX,
                message='Username Must be Alphanumberic',
                code='invalid_username')],
        unique=True,

    )
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    major = models.CharField(max_length=255, default="None")
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email']

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True


"""    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin"""


class Profile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    job_title = models.CharField(max_length=120, null=True, blank=True)
    user_type = models.IntegerField(default=1)

    def __str__(self):
        return smart_text(self.user.username)

    def __unicode__(self):
        return smart_text(self.user.username)


def post_save_user_model_reciever(sender, instance, created, *args, **kwargs):
    if created:
        try:
            Profile.objects.create(user=instance)
        except:
            pass


post_save.connect(post_save_user_model_reciever,
                  sender=settings.AUTH_USER_MODEL)


class Company(models.Model):
    pass

class Address(models.model):
    owner = models.CharField(max_length=200)

"""
	ACCOUNT_PAYABLE = "AP"
	ACCOUNT_RECEIVABLE = "AR"
	CASH ="CASH"
	COST_OF_GOODS_SOLD = "COGS"

"""


class AccountModel(models.Model):  # a record to track financail activities of a specific asset, liability, rquity, revenue or expense equation Assets = Liabilities + equity + revenues - expenses

    ASSETS = 'A'
    LIABILITY = 'L'
    INCOME = 'Rev'
    EXPENSE = 'EXP'
    CAPITAL = 'CAP'
    ACCOUNTS_RECEVIABLE = 'AR'

    """"					DEBIT	CREDIT		"""
    ACCOUNT_CHOICES = [
        (ASSETS, 'Assets'),  # Increase, Decrease
        (LIABILITY, 'Libility'),  # Decrease, Increase
        (INCOME, 'revenue'),  # Decrease, Increase
        (EXPENSE, 'Expense'),  # Increase , Decrease
        (CAPITAL, 'Capital'),  # Decrease, Increase
        (ACCOUNTS_RECEVIABLE, 'Accounts Receivable')

    ]
    name = models.CharField(max_length=64)
    account_type = models.CharField(
        max_length=3, choices=ACCOUNT_CHOICES, default=ASSETS)
    debit = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)
    credit = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)
    balance = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)

    def __unicode__(self):
        return self.name + " : " + self.account_type

    def __str__(self):
        return self.name + " : " + self.account_type


class JournalModel(models.Model):  # records any transaction either eco or no eco
    SALE = 'Sale.'
    PURCHASE = 'Purchase.'
    BANK = 'Bank.'
    CASH = 'Cash.'
    GENERAL = 'General.'
    JOURNAL_CHOICES = [
        (SALE, 'SALE'),
        (PURCHASE, 'PURCHASE'),
        (BANK, 'BANK'),
        (CASH, 'CASH'),
        (GENERAL, 'GENERAL')

    ]
    name = models.CharField(max_length=64)
    journal_type = models.CharField(
        max_length=9, choices=JOURNAL_CHOICES, default=SALE)

    defualt_debit_account_id = models.ForeignKey(
        AccountModel,  on_delete=models.CASCADE, null=True, related_name="debit_account_id")  # always decrease a value of an account
    defualt_credit_account_id = models.ForeignKey(
        AccountModel,  on_delete=models.CASCADE, null=True, related_name="credit_account_id")  # always increase a value of an account

    def __unicode__(self):
        return self.name + " : " + self.defualt_credit_account_id.account_type

    def __str__(self):
        return self.name + " : " + self.defualt_credit_account_id.account_type


"""
a customer who owes 500 for car detail is automatically stored in account receivable once vehicle/purchase is created 
a transaction model will hold information about purchases initialized by the user and is automatically created
transaction should atuomatically creats journal and provide journal with the name of whats the transaction and the balance, and what is the type of account that is debited/credited

a journal model  should provide account with the information needed to adjust the balance for every transaction that occured 

"""


# an event that impact financial statement of the business
class TransactionModel(models.Model):
    # code = models.IntegerField() #auto generated
    name = models.CharField(max_length=64)
    # will choose for example what account to debit from types defined in journal ex: CASH
    journal_id = models.ForeignKey(
        JournalModel,  on_delete=models.CASCADE, null=True, related_name="journal_id_transaction")
    balance = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)


class Invoice(models.Model):
    journal_id = models.ForeignKey(
        JournalModel,  on_delete=models.CASCADE, null=True, related_name="Journal_id_invoice")
    account_id = models.ForeignKey(
        AccountModel,  on_delete=models.CASCADE, null=True, related_name="account_id_invoice")
    number = models.CharField(max_length=64)
    amount = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)


class FiscalYear(models.Model):
    name = models.CharField(max_length=16, default="fiscal year")
    DateFrom = models.DateField()
    DateTo = models.DateField()


class period(models.Model):
    fiscalyeal_id = models.ForeignKey(
        FiscalYear,  on_delete=models.CASCADE, null=True, related_name="fiscalyear_id")


class AssetsModel(models.Model):
    ASSET_CHOICES = []
    name = models.CharField(max_length=65, default="asset name")
    asset_type = models.CharField(
        max_length=3, choices=ASSET_CHOICES, default="ASSETS")
    amount = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)


class LibilitiesMode(models.Model):
    ASSET_CHOICES = []
    name = models.CharField(max_length=65, default="Libility name")
    Libility_type = models.CharField(
        max_length=3, choices=ASSET_CHOICES, default="libility")
    amount = models.DecimalField(
        max_digits=12, decimal_places=2, null=True, default=0.0)
