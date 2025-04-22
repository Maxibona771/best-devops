from flask_sqlalchemy import SQLAlchemy

# создаём экземпляр SQLAlchemy — он будет использоваться во всём проекте
db = SQLAlchemy()

# простая модель User
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)

    def to_dict(self):
        return {"id": self.id, "username": self.username}
