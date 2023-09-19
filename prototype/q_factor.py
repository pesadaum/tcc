import pandas as pd
import numpy as np

def get_q_df(fname):
  return pd.read_csv(fname, 
                     sep='\s+', 
                     header=None, 
                     names=['i_ref', 'Q'])


def q_func_polynomial(x, q_values, deg=6, include_q_drop=False):

    q_values = q_values.copy()

    if include_q_drop:
        # drops Q-factor due to system indefinite oscilation
        q_values.loc[:, 'Q'][q_values['i_ref'] >= 0.9] = 20.0

    fit = np.polyfit(q_values['i_ref'], q_values['Q'], deg)
    poly = np.poly1d(fit)

    return poly
