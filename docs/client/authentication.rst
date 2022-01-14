.. _client_authentication:

Authentication
==============
Most of the functionality provided by this package requires authentication using `Service Account <https://developer.disruptive-technologies.com/docs/service-accounts/introduction-to-service-accounts>`_ credentials configured with sufficient `access rights <https://developer.disruptive-technologies.com/docs/service-accounts/managing-access-rights>`_ for your task.

Credentials can be provided either by setting the following environment variables

.. code-block:: bash

   export DT_SERVICE_ACCOUNT_KEY_ID="<SERVICE_ACCOUNT_KEY_ID>"
   export DT_SERVICE_ACCOUNT_SECRET="<SERVICE_ACCOUNT_SECRET>"
   export DT_SERVICE_ACCOUNT_EMAIL="<SERVICE_ACCOUNT_EMAIL>"

or by providing the credentials programmatically.

.. code-block:: python

   import disruptive as dt
   
   dt.default_auth = dt.Auth.service_account(
       key_id="<SERVICE_ACCOUNT_KEY_ID>",
       secret="<SERVICE_ACCOUNT_SECRET>",
       email="<SERVICE_ACCOUNT_EMAIL>",
   )

Either method authenticates all functionality provided by the package.

Authenticating Individual Requests
----------------------------------

If you wish to individually authenticate each request, or use different Service Account credentials for different calls, each :ref:`Resource Method <client_resources>` can be provided with a :ref:`ServiceAccountAuth <service_account_auth>` object directly.

.. code-block:: python

   sa_auth_1 = dt.Auth.service_account('key1', 'secret1', 'email1')
   sa_auth_2 = dt.Auth.service_account('key2', 'secret2', 'email2')

   # Authenticat each resource method using different credentials.
   device = dt.Device.get_device(device_id, auth=sa_auth_1)
   projects = dt.Project.list_projects(organization_id, auth=sa_auth_2)

Note that this will override other authentication methods that may be active.

.. toctree::
   :maxdepth: 1
   :hidden:
   
   authentication/service_account_credentials
