# Borramos todo registro, para empezar desde 0
User.destroy_all
Company.destroy_all
Income.destroy_all
Expense.destroy_all
Bill_payment.destroy_all
Subscription.destroy_all
Payment.destroy_all
Balance.destroy_all

# Creacion de USUARIOS

puts "Creando Usuario de Matias y Cecilia"
usuario1 = User.create(first_name: "Matias", last_name: "Avaca", email: "avaca.matias1@gmail.com", encrypted_password: "123456", subscription: false)
usuario2 = User.create(first_name: "Cecilia", last_name: "Reynoso", email: "cecireynoso@gmail.com", encrypted_password: "123456", subscription: true)

# Creacion de EMPRESAS

puts "Creando Empresa de Matias y Cecilia"
compañia1_mati = Company.create(user_id: usuario1, name_company: "La Tienda de River", description: "Venta de todo sobre river.")
compañia2_ceci = Company.create(user_id: usuario2, name_company: "Las Flores", description: "Ventas florales.")
compañia3_ceci = Company.create(user_id: usuario2, name_company: "La Zapateria", description: "Ventas de Zapatos.")

# Creacion Subscription Cecilia, Matias no Tiene

puts "Creando Subscripcion de Cecilia"
subscription_ceci = Subscription.create(user_id: usuario2, init_date: "2023-3-18", end_date: "2024-3-18", price_sub: 50)

# Creacion del Metodo de Pago de Cecilia

puts "Creando metodo de pago de Cecilia"
payment_ceci = Payment.create(subscription_id: subscription_ceci, payment_method: "Paypal")


# Creacion de los Ingresos de Matias (solo 3)
puts "Creando Ingresos de Matias Empresa 1 (3)"
income_mati = Income.create(company_id: compañia1_mati, item_name: "Remera de River", date: "2023-4-18", description: "Una Remera Original de River", amount: 100)
income_mati = Income.create(company_id: compañia1_mati, item_name: "Pantalon de River", date: "2023-4-19", description: "Un Pantalon Original de River", amount: 70)
income_mati = Income.create(company_id: compañia1_mati, item_name: "Campera de River", date: "2023-4-19", description: "Una Campera de River", amount: 140)

# Creacion de los Ingresos de Cecilia empresa 1 (solo 5)
puts "Creando Ingresos de Cecilia Empresa 1 (5)"
income_ceci = Income.create(company_id: compañia2_ceci, item_name: "Ramo de Rosas", date: "2023-4-18", description: "Una docena de rosas", amount: 100)
income_ceci = Income.create(company_id: compañia2_ceci, item_name: "Ramo de Margaritas", date: "2023-4-19", description: "Una docena de Margaritas", amount: 100)
income_ceci = Income.create(company_id: compañia2_ceci, item_name: "Ramo de Azuzenas", date: "2023-4-20", description: "Una docena de Azuzenas", amount: 100)
income_ceci = Income.create(company_id: compañia2_ceci, item_name: "Ramo de Rococo", date: "2023-4-21", description: "Una docena de Rococo", amount: 100)
income_ceci = Income.create(company_id: compañia2_ceci, item_name: "Ramo de Lilas", date: "2023-4-22", description: "Una docena de Lilas", amount: 100)

# Creacion de los Ingresos de Cecilia empresa 2 (solo 5)
puts "Creando Ingresos de Cecilia Empresa 2 (5)"
income_ceci2 = Income.create(company_id: compañia3_ceci, item_name: "Zapato rosa", date: "2023-4-18", description: "Un par de zapatos de mujer", amount: 25)
income_ceci2 = Income.create(company_id: compañia3_ceci, item_name: "Zapato azul", date: "2023-4-19", description: "Un par de zapatos de mujer", amount: 30)
income_ceci2 = Income.create(company_id: compañia3_ceci, item_name: "Zapato lila", date: "2023-4-20", description: "Un par de zapatos de mujer", amount: 50)
income_ceci2 = Income.create(company_id: compañia3_ceci, item_name: "Zapato blanco", date: "2023-4-21", description: "Un par de zapatos de mujer", amount: 20)
income_ceci2 = Income.create(company_id: compañia3_ceci, item_name: "Zapato negro", date: "2023-4-22", description: "Un par de zapatos de mujer", amount: 40)

# Creacion de los gastos de Matias empresa 1 (solo 3)
puts "Creando Gastos de Matias Empresa 1 (3)"
expenses_mati = Expense.create(company_id: compañia1_mati, item_name: "Arriendo", date: "2023-4-18", description: "Gasto del arriendo", amount: 300)
expenses_mati = Expense.create(company_id: compañia1_mati, item_name: "Servicios básicos", date: "2023-4-19", description: "Gasto de luz, agua, gas.", amount: 70)
expenses_mati = Expense.create(company_id: compañia1_mati, item_name: "Publicidad", date: "2023-4-19", description: "Publicidad para darse a conocer", amount: 30)


# Creacion de los gastos de Cecilia empresa 1 (solo 5)
puts "Creando Gastos de Cecilia Empresa 1 (5)"
expenses_ceci2 = Expense.create(company_id: compañia2_ceci, item_name: "Arriendo", date: "2023-4-18", description: "Gasto del arriendo", amount: 450)
expenses_ceci2 = Expense.create(company_id: compañia2_ceci, item_name: "Servicios básicos", date: "2023-4-19", description: "Gasto de luz, agua, gas.", amount: 100)
expenses_ceci2 = Expense.create(company_id: compañia2_ceci, item_name: "Publicidad", date: "2023-4-20", description: "Publicidad para darse a conocer", amount: 35)
expenses_ceci2 = Expense.create(company_id: compañia2_ceci, item_name: "Personal", date: "2023-4-21", description: "Pago de un trabajador.", amount: 400)
expenses_ceci2 = Expense.create(company_id: compañia2_ceci, item_name: "Fertilizantes", date: "2023-4-22", description: "Fertilizantes para las flores", amount: 70)

# Creacion de los gastos de Cecilia empresa 2 (solo 5)
puts "Creando Gastos de Cecilia Empresa 2 (5)"
expenses_ceci3 = Expense.create(company_id: compañia3_ceci, item_name: "Arriendo", date: "2023-4-18", description: "Gasto del arriendo", amount: 450)
expenses_ceci3 = Expense.create(company_id: compañia3_ceci, item_name: "Servicios básicos", date: "2023-4-19", description: "Gasto de luz, agua, gas.", amount: 100)
expenses_ceci3 = Expense.create(company_id: compañia3_ceci, item_name: "Publicidad", date: "2023-4-20", description: "Publicidad para darse a conocer", amount: 35)
expenses_ceci3 = Expense.create(company_id: compañia3_ceci, item_name: "Personal", date: "2023-4-21", description: "Pago de un trabajador.", amount: 400)
expenses_ceci3 = Expense.create(company_id: compañia3_ceci, item_name: "Gastos de libreria", date: "2023-4-22", description: "Tijera, papel de envoltorio, hilos.", amount: 800)

# Creacion del tipo de gasto de Matias empresa 1 (solo 3)
puts "Creando Tipos de Gastos de Matias empresa 1"
expense_type_mati = Expense_types.create(expense_types: "Gastos")
expense_type_mati = Expense_types.create(expense_types: "Gastos")
expense_type_mati = Expense_types.create(expense_types: "Gastos")

# Creacion del tipo de gasto de Cecilia empresa 1 (solo 5)
puts "Creando Tipos de Gastos de Cecilia empresa 1"
expense_type_ceci2 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci2 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci2 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci2 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci2 = Expense_types.create(expense_types: "Gastos")

# Creacion del tipo de gasto de Cecilia empresa 2 (solo 5)
puts "Creando Tipos de Gastos de Cecilia empresa 2"
expense_type_ceci3 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci3 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci3 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci3 = Expense_types.create(expense_types: "Gastos")
expense_type_ceci3 = Expense_types.create(expense_types: "Gastos")
