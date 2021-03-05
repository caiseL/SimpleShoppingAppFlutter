import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True
app.config['JSON_SORT_KEYS'] = False
"""implement database"""
products = [{'id': 0,
             'title': 'T-Shirt',
             'price': 50.0,
             'products_sold': 2,
             'image': 'https://images.teemill.com/hqxMaaztpzti26SN0ABzbJgXUdWWswnxcVUrFWJVAVYvYVVV.png.png?w=1080&h=auto'},
            {'id': 1,
             'title': 'Pants',
             'price': 100.0,
             'products_sold': 10,
             'image': 'https://martimx.vteximg.com.br/arquivos/ids/339563-1150-1150/1127866345-1.png?v=637063329340670000'},
            {'id': 2,
             'title': 'X-Mas Sweater',
             'price': 150.0,
             'products_sold': 5,
             'image': 'https://cdn.shopify.com/s/files/1/0107/0340/5120/products/KM_SWEATER_BACK_720x@2x.png?v=1572983793'}, ]


@app.route('/', methods=['GET'])
def home():
    return "<h1>XD</h1>"


@app.route('/api/products/all', methods=['GET'])
def api_all():
    return jsonify(products)


@app.route('/api/products/', methods=['GET'])
def api_id():
    if 'id' in request.args:
        id = int(request.args['id'])
    else:
        return "Error: No id field provided. Please specify an id."

    results = []

    for product in products:
        if(product['id'] == id):
            results.append(product)

    return jsonify(results)


app.run(host='0.0.0.0')
