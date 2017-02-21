# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# Dojit::Application.config.secret_token = '4ba90ea5f61dcb49a67d5272779dacd0b28032aba1e6b00da0b7f7419067f82ee35beb9af5298e570a2773403fb08ae22bd0b638741d20113f666f10d82d59e1'
Dojit::Application.config.secret_key_base = ENV['SECRET_KEY_BASE']
