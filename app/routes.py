from flask import Blueprint, request, jsonify
from .models import db, User

bp = Blueprint('routes', __name__)

@bp.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    return jsonify([user.to_dict() for user in users])

@bp.route('/users', methods=['POST'])
def create_user():
    data = request.get_json()
    if not data or 'username' not in data:
        return jsonify({"error": "Missing username"}), 400

    user = User(username=data['username'])
    db.session.add(user)
    db.session.commit()
    return jsonify(user.to_dict()), 201
