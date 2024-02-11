import os
import atexit
import readline

history = os.path.join(os.environ['XDG_CACHE_HOME'], 'python_history')
try:
    readline.read_history_file(history)
except OSError:
    pass

def write_history():
    try:
        readline.write_history_file(history)
    except OSError:
        pass

atexit.register(write_history)
