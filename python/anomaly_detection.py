 
import pandas as pd
import numpy as np

data = {
    'device_id': ['device_001', 'device_002', 'device_003'],
    'temperature': [22.5, 35.6, 18.3],
    'humidity': [65.3, 15.2, 85.0]
}
df = pd.DataFrame(data)
df['anomaly'] = np.where((df['temperature'] > 30) | (df['humidity'] < 20), True, False)
print(df)
