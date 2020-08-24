from django.db import models

# Create your models here.


class AccountType(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Account(models.Model):
    title = models.CharField(max_length=200)
    account_type = models.ForeignKey('AccountType', on_delete=models.CASCADE)
    description = models.TextField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.title}({self.account_type})'


class TransactionCategory(models.Model):
    account = models.ForeignKey('AccountType', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    description = models.TextField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.title}({self.account})'


class Transaction(models.Model):
    category = models.ForeignKey(
        'TransactionCategory', on_delete=models.CASCADE)
    account_from = models.ForeignKey(
        'Account', related_name='buyer', on_delete=models.CASCADE)
    account_to = models.ForeignKey(
        'Account', related_name='vendor', on_delete=models.CASCADE)
    amount_dr = models.DecimalField(
        null=True, blank=True, max_digits=5, decimal_places=2)
    amount_cr = models.DecimalField(
        null=True, blank=True, max_digits=5, decimal_places=2)
    description = models.TextField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        if self.amount_cr != None:
            return f'{self.account_from} paid {self.amount_dr} to {self.account_to}'
        elif self.amount_dr != None:
            return f'{self.account_from} paid {self.amount_dr} to {self.account_to}'
