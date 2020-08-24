from django.contrib import admin
from .models import AccountType, Account, TransactionCategory, Transaction
# Register your models here.
admin.site.register(AccountType)
admin.site.register(Account)
admin.site.register(TransactionCategory)
admin.site.register(Transaction)
