User Model
----------
  Attributes
  email:String
  name:String
  password_digest:String

Signup/Login System
  Form to create a new user account with an email, name, and password
  Form to login a user with their email and password

Helper Methods
  is_logged_in?
  current_user

OmniAuth
  Ability to login through Facebook


Craft Model
-----------
Attributes
  title:String
  difficulty:String (easy, medium, hard)
  description:String
  image:
  instructions:String

Tag Model
---------
Attributes
name:String


Associations
-------------
  craft has_many tags through craft_tags
  tags has_many crafts through craft_tags
  craft belongs_to user
  user has_many crafts

Validations
-----------
