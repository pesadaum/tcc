import numpy as np
import matplotlib.pyplot as plt

def iteration_graphic(iter_df, fit_df, q_values_df, figsize=(7,5)):
  fig, ax = plt.subplots(figsize=figsize)

  x = fit_df['x']
  y = fit_df['y']
  xn = iter_df['x_next']
  fxn = iter_df['f(x_next)']

  ax.plot(x, y, label='$Q_{meas}$ polynomial fit')
  ax.plot(xn, fxn, 'o', label='$\hat{Q}$ Algorithm output', markersize=5)

  q_x = iter_df.iloc[-1, 6]
  q_y = iter_df.iloc[-1, 7]
  last_iter = iter_df.iloc[-1, 0]

  ax.plot(q_x, q_y, 'o',
            label=f'Last iteration [{last_iter}]:\nx={q_x:.2f}, y={q_y:.2f}',
            c='k', fillstyle='none',)

  ax.plot(q_values_df['i_ref'], q_values_df['Q'], ':o', label='Measured $Q$')

  ax.legend()

  fig.tight_layout()
  
  return (fig, ax)




def multiple_seeks(x0: float, 
                   x1: float, 
                   seek: int, 
                   tol: float, 
                   f_model: callable, 
                   test_results: dict, 
                   MAX_ITER: int,
                   q_min=25, 
                   q_max=300, 
                   step=20,):
  
  multiple_seeks = np.arange(q_min, q_max, step)

  # x == i_ref
  x = np.arange(0, 1, 1e-3)
  f = f_model(x)
  y = f(x)

  m_seeks_records = []
  for seek in multiple_seeks:
    m_seeks_dict = dict()

    res_sec = f_test (x0, x1, seek, tol, f, MAX_ITER, debug=True)
    m_seeks_dict['Method'] = 'basic'
    m_seeks_dict['Seek'] = seek
    m_seeks_dict['Iters-to-converge'] = res_sec['iter'].iat[-1]
    m_seeks_dict['x_next'] = res_sec['x_next'].iat[-1]
    m_seeks_dict['f(x_next)'] = res_sec['f(x_next)'].iat[-1]

    m_seeks_records.append(m_seeks_dict)

    # print(m_seeks_records)
    m_seeks_dict = dict()

    res_mod = mod_secant(x0, x1, seek, tol, f, MAX_ITER, debug=True)
    m_seeks_dict['Method'] = 'modified'
    m_seeks_dict['Seek'] = seek
    m_seeks_dict['Iters-to-converge'] = res_mod['iter'].iat[-1]
    m_seeks_dict['x_next'] = res_mod['x_next'].iat[-1]
    m_seeks_dict['f(x_next)'] = res_mod['f(x_next)'].iat[-1]

    m_seeks_records.append(m_seeks_dict)

  m_seeks_df = pd.DataFrame(m_seeks_records)
  m_seeks_df.tail(4)
