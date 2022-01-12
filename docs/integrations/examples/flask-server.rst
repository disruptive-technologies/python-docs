.. _flask_server_example:

Flask Event Decode
==================
The following example shows how to set up a simple Flask server for which we receive HTTP Post requests forwarded by a Data Connector. Contained within each request is event data from your sensors, and the request is validated and decoded using functions provided by this package.

.. code-block:: python

   import os
   from flask import Flask, request  # pip install flask
   from dtintegrations import data_connector, provider
   app = Flask(__name__)
   
   @app.route('/', methods=['POST'])
   def dataconnector_endpoint():
       # Use the provider-specific validation function.
       payload = data_connector.http_push.decode_request(
           request=request,
           provider=provider.FLASK,
           secret=os.getenv('DT_SIGNATURE_SECRET'),
       )
   
       # Print the payload data.
       print(payload)
   
       # If all is well, return 200 response.
       return 'Success'

For a more comprehensive guide, our developer documentation contains a guide on how to use this kind of code to `integrate with Heroku <https://developer.disruptive-technologies.com/docs/data-connectors/example-integrations/heroku>`_ and other popular serverless cloud environments.

