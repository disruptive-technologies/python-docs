.. _threaded_stream_example:

Threaded Stream
===============
In this example, the :code:`disruptive.Stream.event_stream()` resource method and built-in `threading` package is used together to continuously stream events in a separate thread, independent of the main program. Every time a new event appears in the stream it is appended to a buffer list which is accessible from the main thread.

Full Example
------------
The following snippet implements the example. Remember to update user-defined variables.

.. code-block:: python 

   import time
   import threading
   
   import disruptive as dt
   
   # User-defined variables.
   PROJECT_ID = '<YOUR_PROJECT_ID>'
   
   
   # Function which will be the target for our thread.
   def stream_worker(project_id: str):
       # Create stream generator
       for new_event in dt.Stream.event_stream(project_id):
           # When a new event arrives, lock buffer before writing.
           print('[Thread] New Event')
           with buffer_lock:
               print('\t- locked')
               # Append new event to our buffer.
               event_buffer.append(new_event)
           print('\t- unlocked')
   
   
   # Initialize the stream buffer list where we will store events.
   event_buffer: list = []
   
   # Use locking to avoid corrupting data by writing simultaneously.
   buffer_lock = threading.Lock()
   
   # Start the stream worker in a separate thread.
   t = threading.Thread(
       target=stream_worker,
       args=(PROJECT_ID,),
   )
   t.start()
   
   # Do something else while stream is running in the background.
   # Here we print and trim the buffer length every 5 second.
   while True:
       # Print length of the buffer.
       n_events = len(event_buffer)
       print('[Main] Length: {}/15. Popping {} events.'.format(
           n_events,
           -1*(min(0, 15-n_events)),
       ))
   
       # Pop older events until buffer is no longer than 15.
       while len(event_buffer) > 15:
           print('\t- pop')
           event_buffer.pop(0)
   
       # Patiently wait for 5 seconds.
       time.sleep(5)

Step-by-Step Explanation
------------------------
The package is authenticated as described in the :ref:`Authentication <client_authentication>` using environment variables.

When using the `threading` package, the target code to be ran in the newly spawned thread must be wrapped in a function, here called :code:`stream_worker`. It's job is to start the stream generator, then append new events to buffer as they arrive.

.. code-block:: python

   # Function which will be the target for our thread.
   def stream_worker(project_id):
       # Create stream generator
       for new_event in dt.Stream.event_stream(project_id):
           # When a new event arrives, lock buffer before writing.
           print('[Thread] New Event')
           with buffer_lock:
               print('\t- locked')
               # Append new event to our buffer.
               event_buffer.append(new_event)
           print('\t- unlocked')

Before the thread is spawned using the target :code:`stream_worker`, a locking object is created. This can be called inside the thread when writing or reading a variable to make sure that other jobs that want to use it, like our main code, has to wait until we finish.

.. code-block:: python

   # Use locking to avoid corrupting data by writing simultaneously.
   buffer_lock = threading.Lock()
   
   # Start the stream worker in a separate thread.
   t = threading.Thread(
       target=stream_worker,
       args=(PROJECT_ID,),
   )
   t.start()

The rest is simply an infinite :code:`while` loop that trims the buffer to a certain length every 5 seconds. This is where your main code would go.

.. code-block:: python

   # Do something else while stream is running in the background.
   # Here we print and trim the buffer length every 5 second.
   while True:
       # Print length of the buffer.
       n_events = len(event_buffer)
       print('[Main] Length: {}/15. Popping {} events.'.format(
           n_events,
           -1*(min(0, 15-n_events)),
       ))
   
       # Pop older events until buffer is no longer than 15.
       while len(event_buffer) > 15:
           print('\t- pop')
           event_buffer.pop(0)
   
       # Patiently wait for 5 seconds.
       time.sleep(5)
