from database import db

class Employee:
  def __init__(self, employee_id):
    self.database = db
    self.id = employee_id
    self.name = None
    self.phone_number = None
    self.job_title = None
    self.load()

  def load(self):
    query = """SELECT Employee.name, Employee.phone_number, Employee.job_title                                                                         FROM Employee  
                WHERE Employee.employee_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.name = data['name']
    self.phone_number = data['phone_number']
    self.job_title = data['job_title']

class TrainStation:
  def __init__(self, station_id):
    self.database = db
    self.id = station_id
    self.name = None
    self.location = None
    self.address = None
    self.load()

  def load(self):
    query = """SELECT Trainstation.name, Trainstation.location, Trainstation.address                                                               FROM TrainStation
               WHERE Trainstation.station_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.address = data['address']
    self.name = data['name']
    self.location = data['location'] 

class GeneralUser:
  def __init__(self, general_user_id):
    self.database = db
    self.id = general_user_id
    self.username = None
    self.load()

  def load(self):
    query = """SELECT GeneralUser.username
               FROM GeneralUser
               WHERE GeneralUser.general_user_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.username = data['username']

class RegisteredUser:
  def __init__(self, registered_user_id):
    self.database = db
    self.id = registered_user_id
    self.username = None
    self.email_address = None
    self.password = None
    self.contact_details = None
    self.travel_history = None
    self.load()

  def load(self):
    query = """SELECT RegisteredUser.username, RegisteredUser.email_address, RegisteredUser.password, RegisteredUser.contact_details, RegisteredUser.travel_history
               FROM RegisteredUser
               WHERE RegisteredUser.registered_user_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.username = data['username']
    self.email_address = data['email_address']
    self.password = data['password']
    self.contact_details = data['contact_details']
    self.travel_history = data['travel_history']

class Role:
  def __init__(self, role_id):
    self.database = db
    self.id = role_id
    self.role_name = None
    self.user_role = None
    self.load()

  def load(self):
    query = """SELECT Role.role_name, Role.user_role
               FROM Role
               WHERE Role.role_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.role_name = data['role_name']
    self.user_role = data['user_role']

class Account:
  def __init__(self, account_id):
    self.database = db
    self.id = account_id
    self.general_user = None
    self.registered_user = None
    self.role = None
    self.load()

  def load(self):
    query = """SELECT Account.general_user, Account.registered_user, Account.role
               FROM Account
               WHERE Account.account_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.general_user = data['general_user']
    self.registered_user = data['registered_user']
    self.role = data['role']

class Train:
  def __init__(self, train_id):
    self.database = db
    self.id = train_id
    self.schedule = None
    self.route = None
    self.capacity = None
    self.current_speed = None
    self.load()

  def load(self):
    query = """SELECT Train.schedule, Train.route, Train.capacity, Train.current_speed
               FROM Train
               WHERE Train.train_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.schedule = data['schedule']
    self.route = data['route']
    self.capacity = data['capacity']
    self.current_speed = data['current_speed']

class Carriage:
  def __init__(self, carriage_id):
    self.database = db
    self.id = carriage_id
    self.train_id = None
    self.seat_capacity = None
    self.carriage_type = None
    self.load()

  def load(self):
    query = """SELECT Carriage.train_id, Carriage.seat_capacity, Carriage.carriage_type
               FROM Carriage
               WHERE Carriage.carriage_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.train_id = data['train_id']
    self.seat_capacity = data['seat_capacity']
    self.carriage_type = data['carriage_type']

class Maintenance:
  def __init__(self, maintenance_id):
    self.database = db
    self.id = maintenance_id
    self.train_id = None
    self.maintenance_date = None
    self.maintenance_type = None
    self.load()

  def load(self):
    query = """SELECT train_id as , maintenance_date, maintenance_type
               FROM Maintenance
               WHERE maintenance_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.train_id = data['train_id']
    self.maintenance_date = data['maintenance_date']
    self.maintenance_type = data['maintenance_type']

class Seat:
  def __init__(self, seat_id):
    self.database = db
    self.id = seat_id
    self.carriage_id = None
    self.is_booked = None
    self.booked_by = None
    self.load()

  def load(self):
    query = """SELECT carriage_id, is_booked, booked_by
               FROM Seat
               WHERE seat_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.carriage_id = data['carriage_id']
    self.is_booked = data['is_booked']
    self.booked_by = data['booked_by']

class Payment:
  def __init__(self, payment_id):
    self.database = db
    self.id = payment_id
    self.passenger_id = None
    self.amount = None
    self.payment_date = None
    self.load()

  def load(self):
    query = """SELECT passenger_id, amount, payment_date
               FROM Payment
               WHERE payment_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.passenger_id = data['passenger_id']
    self.amount = data['amount']
    self.payment_date = data['payment_date']

class Ticket:
  def __init__(self, ticket_id):
    self.database = db
    self.id = ticket_id
    self.passenger_id = None
    self.schedule_id = None
    self.carriage_id = None
    self.seat_id = None
    self.payment_id = None
    self.load()

  def load(self):
    query = """SELECT passenger_id, schedule_id, carriage_id, seat_id, payment_id
               FROM Ticket
               WHERE ticket_id = %s"""
    arguments = (self.id,)
    data = self.database.select(query, arguments)
    data = data[0]
    self.passenger_id = data['passenger_id']
    self.schedule_id = data['schedule_id']
    self.carriage_id = data['carriage_id']
    self.seat_id = data['seat_id']
    self.payment_id = data['payment_id']
