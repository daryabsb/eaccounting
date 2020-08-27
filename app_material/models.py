

# class Transaction():

#     transaction_type = ''
#     transaction_category = 0  # Revenue, Cash
#     amount_dr = 0
#     amount_cr = 0


class Account():

    account = ''  # Assets, Liability, Equity, Revenue, Expense


class AccountHead():

    account_title = ''
    account_number = 0
    description = ''
    phone = 0
    address = ''
    account_type_id = 0
    balance = 0
    sys = 0


class AccountType():

    account_type = varchar(100)
    account_id = int(5)


class Transaction():

    transaction_id = int(11)
    # '1=Deposit, 2=Expense, 3=AP, 4=AR, 5= Account Transfer',
    transaction_type_id = tinyint(2)
    transaction_type = varchar(100)
    account_id = int(11)
    category_id = int(11)
    amount = decimal(13, 2)
    description = varchar(200)
    payment_method = varchar(100)
    ref = varchar(150) NOT NULL,
    balance = decimal(13, 2)
    date_time = timestamp
    transfer_ref = int(11)

    def getCategory(self, tran_type):
        if tran_type = 1:
            return 2
        elif tran_type = 2:
            return 1
        else return 0


class TransactionsCategory():

    name = varchar(100)
    description = varchar(100)
    type = tinyint(2)


class TransactionType():
    title = ''  # Payment, Refund, Repeat
