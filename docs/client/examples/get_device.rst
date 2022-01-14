.. _get_device_example:

Get Device
==========
In this example, a single device is fetched and printed to console.

Full Example
------------
The following snippet implements the example. Remember to update user-defined variables.

.. code-block:: python

   import disruptive as dt

   # User-defined variables.
   DEVICE_ID = '<YOUR_DEVICE_ID>'
   
   # Get the device of interest.
   device = dt.Device.get_device(device_id=DEVICE_ID)
   
   # Print the device information to console.
   print(device)

This will generate an output similar to the snippet below.

.. code-block::

   Device(
       device_id: str = bfui341o5b7g0093am50,
       project_id: str = br793014jplfqcpoj45g,
       device_type: str = temperature,
       labels: dict = {'inertia-model': '0.025'},
       display_name: str = Fridge,
       is_emulated: bool = False,
       ...
   )

Step-by-Step Explanation
------------------------
The package is authenticated as described in the :ref:`Authentication <client_authentication>` using environment variables.

Once authenticated, a single device is fetched using the :code:`get_device()` resource method.

.. code-block:: python

   device = dt.Device.get_device(device_id=DEVICE_ID)

The returned variable is an instance of the :ref:`Device <device>` class, representing the various attributes that describe the device. Printing the object will give you an overview of the attributes.

.. code-block:: python

   print(device)
