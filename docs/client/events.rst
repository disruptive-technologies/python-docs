.. _client_events:

Events
======
When interacting the :ref:`EventHistory <eventhistory>` or :ref:`Stream <stream>` resources, fetched events are represented by an instance of the :ref:`Event <client_events>` class.

.. autoclass:: disruptive.events.Event

.. _event_types:

Type Constants
--------------
A constant for each event type is available in the `events` module.

.. autoattribute:: disruptive.events.TOUCH
.. autoattribute:: disruptive.events.TEMPERATURE
.. autoattribute:: disruptive.events.OBJECT_PRESENT
.. autoattribute:: disruptive.events.HUMIDITY
.. autoattribute:: disruptive.events.OBJECT_PRESENT_COUNT
.. autoattribute:: disruptive.events.TOUCH_COUNT
.. autoattribute:: disruptive.events.WATER_PRESENT
.. autoattribute:: disruptive.events.NETWORK_STATUS
.. autoattribute:: disruptive.events.BATTERY_STATUS
.. autoattribute:: disruptive.events.LABELS_CHANGED
.. autoattribute:: disruptive.events.CONNECTION_STATUS
.. autoattribute:: disruptive.events.ETHERNET_STATUS
.. autoattribute:: disruptive.events.CELLULAR_STATUS
.. autoattribute:: disruptive.events.CO2
.. autoattribute:: disruptive.events.PRESSURE
.. autoattribute:: disruptive.events.MOTION
.. autoattribute:: disruptive.events.DESK_OCCUPANCY
.. autoattribute:: disruptive.events.CONTACT
.. autoattribute:: disruptive.events.PROBE_WIRE_STATUS

This can be useful when using resource methods where one can filter on event types.

.. code-block:: python

   # Fetch touch- and humidity event history.
   history = disruptive.EventHistory.list_events(
      device_id='<DEVICE_ID>',
      project_id='<PROJECT_ID>',
      event_types=[
         disruptive.events.TOUCH,
         disruptive.events.HUMIDITY,
      ],
   )

.. _eventdata:

Event Data
----------
The following classes each represent one type-specific event data that can be encountered. Instances are found in the :code:`data` attribute of an :ref:`Event <client_events>` or the :code:`reported` attribute of a :ref:`Device <device>`.

- :ref:`Touch <touch_event>`
- :ref:`Temperature <temperature_event>`
- :ref:`TemperatureSample <temperature_sample_event>`
- :ref:`ObjectPresent <objectpresent_event>`
- :ref:`Humidity <humidity_event>`
- :ref:`ObjectPresentCount <objectpresentcount_event>`
- :ref:`TouchCount <touchcount_event>`
- :ref:`WaterPresent <waterpresent_event>`
- :ref:`NetworkStatus <networkstatus_event>`
- :ref:`BatteryStatus <batterystatus_event>`
- :ref:`LabelsChanged <labelschanged_event>`
- :ref:`ConnectionStatus <connectionstatus_event>`
- :ref:`EthernetStatus <ethernetstatus_event>`
- :ref:`CellularStatus <cellularstatus_event>`
- :ref:`Co2 <co2_event>`
- :ref:`Pressure <pressure_event>`
- :ref:`Motion <motion_event>`
- :ref:`DeskOccupancy <desk_occupancy_event>`
- :ref:`Contact <contact_event>`
- :ref:`ProbeWireStatus <probe_wire_status_event>`

.. _touch_event:
.. autoclass:: disruptive.events.Touch

   .. automethod:: disruptive.events.Touch.__init__

.. _temperature_event:
.. autoclass:: disruptive.events.Temperature

   .. automethod:: disruptive.events.Temperature.__init__


.. _temperature_sample_event:
.. autoclass:: disruptive.events.TemperatureSample

   .. automethod:: disruptive.events.TemperatureSample.__init__

.. _objectpresent_event:
.. autoclass:: disruptive.events.ObjectPresent

   .. automethod:: disruptive.events.ObjectPresent.__init__

.. _humidity_event:
.. autoclass:: disruptive.events.Humidity

   .. automethod:: disruptive.events.Humidity.__init__

.. _objectpresentcount_event:
.. autoclass:: disruptive.events.ObjectPresentCount

   .. automethod:: disruptive.events.ObjectPresentCount.__init__

.. _touchcount_event:
.. autoclass:: disruptive.events.TouchCount

   .. automethod:: disruptive.events.TouchCount.__init__

.. _waterpresent_event:
.. autoclass:: disruptive.events.WaterPresent

   .. automethod:: disruptive.events.WaterPresent.__init__

.. _networkstatus_event:
.. autoclass:: disruptive.events.NetworkStatus

   .. automethod:: disruptive.events.NetworkStatus.__init__

.. _batterystatus_event:
.. autoclass:: disruptive.events.BatteryStatus

   .. automethod:: disruptive.events.BatteryStatus.__init__

.. _labelschanged_event:
.. autoclass:: disruptive.events.LabelsChanged

.. _connectionstatus_event:
.. autoclass:: disruptive.events.ConnectionStatus

   .. automethod:: disruptive.events.ConnectionStatus.__init__

.. _ethernetstatus_event:
.. autoclass:: disruptive.events.EthernetStatus

   .. automethod:: disruptive.events.EthernetStatus.__init__

.. _cellularstatus_event:
.. autoclass:: disruptive.events.CellularStatus

   .. automethod:: disruptive.events.CellularStatus.__init__

.. _co2_event:
.. autoclass:: disruptive.events.Co2

   .. automethod:: disruptive.events.Co2.__init__

.. _pressure_event:
.. autoclass:: disruptive.events.Pressure

   .. automethod:: disruptive.events.Pressure.__init__

.. _motion_event:
.. autoclass:: disruptive.events.Motion

   .. automethod:: disruptive.events.Motion.__init__

.. _desk_occupancy_event:
.. autoclass:: disruptive.events.DeskOccupancy

   .. automethod:: disruptive.events.DeskOccupancy.__init__

.. _contact_event:
.. autoclass:: disruptive.events.Contact

   .. automethod:: disruptive.events.Contact.__init__

.. _probe_wire_status_event:
.. autoclass:: disruptive.events.ProbeWireStatus

   .. automethod:: disruptive.events.ProbeWireStatus.__init__