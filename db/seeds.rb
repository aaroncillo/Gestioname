# Borramos todo registro, para empezar desde 0
Balance.destroy_all
Income.destroy_all
Expense.destroy_all
ExpenseType.destroy_all
Payment.destroy_all
Company.destroy_all
Subscription.destroy_all
User.destroy_all

# Creacion de USUARIOS

puts "Creando Usuario de Matias y Cecilia"
usuario1 = User.create!(first_name: "Matias", last_name: "Avaca", email: "avaca.matias1@gmail.com", password: "123456", subscription: false)
usuario2 = User.create!(first_name: "Cecilia", last_name: "Reynoso", email: "cecireynoso@gmail.com", password: "123456", subscription: true)

# Creacion de EMPRESAS

puts "Creando Empresa de Matias y Cecilia"
compañia1_mati = Company.create!(user_id: usuario1.id, name_company: "La Tienda de River", description: "Venta de todo sobre river.")
compañia1_ceci = Company.create!(user_id: usuario2.id, name_company: "Las Flores", description: "Ventas florales.")
compañia2_ceci = Company.create!(user_id: usuario2.id, name_company: "La Zapateria", description: "Ventas de Zapatos.")

# Creacion Subscription Cecilia, Matias no Tiene

puts "Creando Subscripcion de Cecilia"
subscription_ceci = Subscription.create!(user_id: usuario2.id, init_date: "2023-3-18", end_date: "2024-3-18", price_sub: 50)

# Creacion del Metodo de Pago de Cecilia

puts "Creando metodo de pago de Cecilia"
payment_ceci = Payment.create!(subscription_id: subscription_ceci.id, payment_method: "Paypal")


# Creacion de los Ingresos de Matias (solo 3)
puts "Creando Ingresos de Matias Empresa 1 (3)"
income_mati = Income.create!(company_id: compañia1_mati.id, item_name: "Remera de River", date: "2023-4-18", description: "Una Remera Original de River", amount: 100)
income_mati = Income.create!(company_id: compañia1_mati.id, item_name: "Pantalon de River", date: "2023-4-19", description: "Un Pantalon Original de River", amount: 70)
income_mati = Income.create!(company_id: compañia1_mati.id, item_name: "Campera de River", date: "2023-4-19", description: "Una Campera de River", amount: 140)

# Creacion de los Ingresos de Cecilia empresa 1 (solo 5)
puts "Creando Ingresos de Cecilia Empresa 1 (5)"
income_ceci = Income.create!(company_id: compañia1_ceci.id, item_name: "Ramo de Rosas", date: "2023-4-18", description: "Una docena de rosas", amount: 100)
income_ceci = Income.create!(company_id: compañia1_ceci.id, item_name: "Ramo de Margaritas", date: "2023-4-19", description: "Una docena de Margaritas", amount: 100)
income_ceci = Income.create!(company_id: compañia1_ceci.id, item_name: "Ramo de Azuzenas", date: "2023-4-20", description: "Una docena de Azuzenas", amount: 100)
income_ceci = Income.create!(company_id: compañia1_ceci.id, item_name: "Ramo de Rococo", date: "2023-4-21", description: "Una docena de Rococo", amount: 100)
income_ceci = Income.create!(company_id: compañia1_ceci.id, item_name: "Ramo de Lilas", date: "2023-4-22", description: "Una docena de Lilas", amount: 100)

# Creacion de los Ingresos de Cecilia empresa 2 (solo 5)
puts "Creando Ingresos de Cecilia Empresa 2 (5)"
income_ceci2 = Income.create!(company_id: compañia2_ceci.id, item_name: "Zapato rosa", date: "2023-4-18", description: "Un par de zapatos de mujer", amount: 25)
income_ceci2 = Income.create!(company_id: compañia2_ceci.id, item_name: "Zapato azul", date: "2023-4-19", description: "Un par de zapatos de mujer", amount: 30)
income_ceci2 = Income.create!(company_id: compañia2_ceci.id, item_name: "Zapato lila", date: "2023-4-20", description: "Un par de zapatos de mujer", amount: 50)
income_ceci2 = Income.create!(company_id: compañia2_ceci.id, item_name: "Zapato blanco", date: "2023-4-21", description: "Un par de zapatos de mujer", amount: 20)
income_ceci2 = Income.create!(company_id: compañia2_ceci.id, item_name: "Zapato negro", date: "2023-4-22", description: "Un par de zapatos de mujer", amount: 40)

# Creacion del tipo de gasto de Matias empresa 1 (solo 3)
puts "Creando Tipos de Gastos de Matias empresa 1"
expense_type_mati = ExpenseType.create!(expense_category: "Arriendo",company_id: compañia1_mati.id )
expense_type_mati2 = ExpenseType.create!(expense_category: "Servicios básicos",company_id: compañia1_mati.id )
expense_type_mati3 = ExpenseType.create!(expense_category: "Personal",company_id: compañia1_mati.id )

# Creacion del tipo de gasto de Cecilia empresa 1 (solo 5)
puts "Creando Tipos de Gastos de Cecilia empresa 1"
expense_type_ceci1 = ExpenseType.create!(expense_category: "Arriendo",company_id: compañia1_ceci.id)
expense_type_ceci2 = ExpenseType.create!(expense_category: "Servicios básicos",company_id: compañia2_ceci.id)
expense_type_ceci3 = ExpenseType.create!(expense_category: "Personal",company_id: compañia1_ceci.id)
expense_type_ceci4 = ExpenseType.create!(expense_category: "Proveedores",company_id: compañia1_ceci.id)
expense_type_ceci5 = ExpenseType.create!(expense_category: "Transporte",company_id: compañia1_ceci.id)

# Creacion del tipo de gasto de Cecilia empresa 2 (solo 5)
puts "Creando Tipos de Gastos de Cecilia empresa 2"
expense_type_ceci6 = ExpenseType.create!(expense_category: "Arriendo",company_id: compañia2_ceci.id)
expense_type_ceci7 = ExpenseType.create!(expense_category: "Marketing",company_id: compañia2_ceci.id)
expense_type_ceci8 = ExpenseType.create!(expense_category: "Servicios básicos",company_id: compañia2_ceci.id)
expense_type_ceci9 = ExpenseType.create!(expense_category: "Personal",company_id: compañia2_ceci.id)
expense_type_ceci10 = ExpenseType.create!(expense_category: "Materia Prima",company_id: compañia2_ceci.id)

# Creacion de los gastos de Matias empresa 1 (solo 3)
puts "Creando Gastos de Matias Empresa 1 (3)"
expenses_mati = Expense.create!(company_id: compañia1_mati.id, item_name: "Arriendo", date: "2023-4-18", description: "Gasto del arriendo", amount: 300, expense_type_id: expense_type_mati.id)
expenses_mati = Expense.create!(company_id: compañia1_mati.id, item_name: "Agua y luz", date: "2023-4-19", description: "Gasto de luz, agua, gas.", amount: 70, expense_type_id: expense_type_mati2.id)
expenses_mati = Expense.create!(company_id: compañia1_mati.id, item_name: "Publicidad", date: "2023-4-19", description: "Publicidad para darse a conocer", amount: 30, expense_type_id: expense_type_mati3.id)


# Creacion de los gastos de Cecilia empresa 1 (solo 5)
puts "Creando Gastos de Cecilia Empresa 1 (5)"
expenses_ceci1 = Expense.create!(company_id: compañia1_ceci.id, item_name: "Arriendo", date: "2023-4-18", description: "Gasto del arriendo", amount: 450, expense_type_id: expense_type_ceci1.id)
expenses_ceci1 = Expense.create!(company_id: compañia1_ceci.id, item_name: "Agua y luz", date: "2023-4-19", description: "Gasto de luz, agua, gas.", amount: 100, expense_type_id: expense_type_ceci2.id)
expenses_ceci1 = Expense.create!(company_id: compañia1_ceci.id, item_name: "Publicidad", date: "2023-4-20", description: "Publicidad para darse a conocer", amount: 35, expense_type_id: expense_type_ceci3.id)
expenses_ceci1 = Expense.create!(company_id: compañia1_ceci.id, item_name: "Personal", date: "2023-4-21", description: "Pago de un trabajador.", amount: 400, expense_type_id: expense_type_ceci4.id)
expenses_ceci1 = Expense.create!(company_id: compañia1_ceci.id, item_name: "Fertilizantes", date: "2023-4-22", description: "Fertilizantes para las flores", amount: 70, expense_type_id: expense_type_ceci5.id)

# Creacion de los gastos de Cecilia empresa 2 (solo 5)
puts "Creando Gastos de Cecilia Empresa 2 (5)"
expenses_ceci2 = Expense.create!(company_id: compañia2_ceci.id, item_name: "Arriendo", date: "2023-4-18", description: "Gasto del arriendo", amount: 450, expense_type_id: expense_type_ceci6.id)
expenses_ceci2 = Expense.create!(company_id: compañia2_ceci.id, item_name: "Agua y luz", date: "2023-4-19", description: "Gasto de luz, agua, gas.", amount: 100, expense_type_id: expense_type_ceci7.id)
expenses_ceci2 = Expense.create!(company_id: compañia2_ceci.id, item_name: "Publicidad", date: "2023-4-20", description: "Publicidad para darse a conocer", amount: 35, expense_type_id: expense_type_ceci8.id)
expenses_ceci2 = Expense.create!(company_id: compañia2_ceci.id, item_name: "Personal", date: "2023-4-21", description: "Pago de un trabajador.", amount: 400, expense_type_id: expense_type_ceci9.id)
expenses_ceci2 = Expense.create!(company_id: compañia2_ceci.id, item_name: "Productos de libreria", date: "2023-4-22", description: "Tijera, papel de envoltorio, hilos.", amount: 800, expense_type_id:expense_type_ceci10.id)


# Balances de Matias empresa 1

balance_mati = Balance.create!(company_id: compañia1_mati.id, total: 1500)

# Balances de Cecilia empresa 1

balance_ceci1 = Balance.create!(company_id: compañia1_ceci.id, total: 550)

# Balances de Cecilia empresa 2

balance_ceci2 = Balance.create!(company_id: compañia2_ceci.id, total: 5340)
