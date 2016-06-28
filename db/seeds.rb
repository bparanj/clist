u = User.create! handle: "bbunny", email: "bugs@example.com", password: "secret"

u.tasks.create! name: "Meet Mr. Miyagi", complete: true
u.tasks.create! name: "Paint the fence", complete: true
u.tasks.create! name: "Wax the car"
u.tasks.create! name: "Sand the deck"
