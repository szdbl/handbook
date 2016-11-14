# import
import pandas as pd
import numpy as np
#from pandas.io.json import json_normalize
import matplotlib.pyplot as plt
import matplotlib as mpl
import os
#from json import json_util, ObjectId
#import json
from datetime import datetime, timedelta
#import pytz

# setting
pd.set_option('max_columns', None)
pd.set_option('max_rows', 500)
mpl.style.use('ggplot')

# magic
from IPython import get_ipython # in order to run in Py script
ipython = get_ipython()
ipython.magic("matplotlib inline")