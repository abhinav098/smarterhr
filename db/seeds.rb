
user = User.create([{first_name:"Prepsmarter", last_name:"Inc", email:"hello@prepsmarter.com", password:"hello123",
                     password_confirmation:"hello123"}])

equipment7 = Equipment.create(name:'MacBook Pro1', description: "machine required for coding purposes",kind:0)
equipment6 = Equipment.create(name:'MacBook air1', description: "machine required for coding purposes",kind:0)
equipment1 = Equipment.create(name:'Iphone 6s1', description: "machine required for iOS app purposes",kind:0)
equipment2 = Equipment.create(name:'Sony Experia1', description: "machine required for testing purposes", kind:0)
equipment3 = Equipment.create(name:'Moto M1', description: "machine required for testing purposes", kind:0)
equipment4 = Equipment.create(name:'Notepad1', description: "required for noting stuff purposes", kind:1)
equipment5 = Equipment.create(name:'Pen1', description: "Required for writing", kind:1)

access = Access.create(name:'pslearn code', description: "read write access",kind:3)
access = Access.create(name:'psmobile code', description: "read write access",kind:3)
access = Access.create(name:'sales', description: "managin users and sales",kind:1)
access = Access.create(name:'tester', description: "testing accesses",kind:0)
access = Access.create(name:'developer', description: "development, deployment accesses",kind:3)
access = Access.create(name:'admin', description: "Admin access , manager of all ",kind:1)
