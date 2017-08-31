#Create a class for Accounts

class Account
	attr_accessor :name, :balance
	attr_reader :account

	def initialize(name,account,balance)
		@name = name
		@account = account
		@balance = balance
	end	

	def add_funds(amount)	
		@balance += amount
	end	

	def withdraw_funds(amount)
		#checks if the amount being taken is less than available
		if @balance < amount
			puts "Insufficent funds! Choose a smaller amount!"
		else
			@balance -= amount
			puts "Your withdrawl of $#{amount} has been made.  Your new balance is $#{@balance}"
		end		
	end	


end	


#This is the menu for the main screen
def main_menu
	puts "Welcome to Creighton Bank!"
	puts "Please make choose an option:"
	puts "------------------------------"
	puts "1. Create a new account"
	puts "2. View Account Information"
	puts "3. Exit Program"

	print "Option:  "

	option = gets.chomp.to_i

	if option == 1
			create_account
			main_menu
	elsif option == 2
			account_menu
	elsif option == 3
			puts "Thank you for stopping by!"
	else
		puts "Invalid entry! Please choose from the available options!"
		main_menu

	end	
end	


def create_account
	print "Please enter a name: "
	name = gets.chomp.upcase
	print "Enter a starting balance: "
	balance = gets.chomp.to_f
	acct_num = @accounts.length + 1
	new_account = Account.new(name,acct_num,balance)
	@accounts.push(new_account)

	@accounts.each do |a|
		if a.name == name && a.account == acct_num
			puts "Account has been created:"
			puts "Name: #{a.name}"
			puts "Account No.: #{a.account}"
			puts "Balance: #{a.balance}"
			puts "Please make a note of this information."
		end	
	end
end	


def account_menu
	balance = 0	
	found = false # Checks to see if the account is found
	puts "\n"
	puts "Welcome to the Accounts Menu.  Please login in."
	print "Name: "
	name = gets.chomp.upcase
	print "Account Number: "
	acct_num = gets.chomp.to_i

	@accounts.each do |a| 
		if a.name == name && a.account == acct_num 
			balance = a.balance
			found = true # if the account is found this becomes true
		end	
	end		

	if found == true  #account is found, move on to view_account
		view_account(name,acct_num,balance) 
	elsif @count < 2 #otherswise, user has 3 chances to login
		@count +=1
		puts "Account not found, please try again"	
		puts "Attempts left: #{3 - @count}"
		account_menu
	else
		puts "Sorry, account not found.  Please contact customer service."	
		main_menu
	end	

end


def view_account(name,acct_num,balance)

	puts "\n"
	puts "Welcome to Your Account #{name}"
	puts "Choose from the following options: "
	puts "------------------------------------"
	puts "1. View Account Balance"
	puts "2. Make A Deposit"
	puts "3. Make A withdrawal"
	puts "4. Back to Main Menu"

	choice = gets.chomp.to_i

	if choice == 1
	 view_balance(name,acct_num,balance)
	elsif choice ==2
		make_deposit(name,acct_num)
	elsif choice == 3
		make_withdrawal(name,acct_num)
	elsif choice == 4
		main_menu
	else
		puts "Invalid entry!"
		view_account(name, acct_num,balance)	
	end	

end	


def view_balance(name,acct_num,balance)

	puts "You current balance for account number #{acct_num} is $#{balance}"
	view_account(name,acct_num,balance)
	
end	


def make_deposit(name,acct_num)
	balance = 0
 	puts "How much would you like to deposit?"
 	amount = gets.chomp.to_f

	@accounts.each do |a| 
		if a.name == name && a.account == acct_num 
				a.add_funds(amount)
				balance = a.balance
				puts "Your deposit of $#{amount} has been made.  Your new balance is $#{a.balance}."
		end	
	end		
	view_account(name,acct_num,balance)
end	


def make_withdrawal(name,acct_num)
	balance = 0
	puts "How much would you like to withdraw?"
	amount = gets.chomp.to_f

	@accounts.each do |a|
		if a.name == name && a.account == acct_num
			a.withdraw_funds(amount)
			balance = a.balance
		end
	end
	view_account(name,acct_num,balance)		
end	


#----- Main Program --------->

@count = 0
@accounts = []


system("clear")

main_menu





