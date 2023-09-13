import numpy as np
import pandas as pd


def secant(x0: float,
           x1: float,
           SEEK: int,
           TOL: float,
           f: callable,
           MAX_ITER: int,
           debug=False):
    """
    # Description
    Computes SEEK = f(x) for a given function and a given set of values using a modified version of the secant method

    # Parameters
    @param x0: initial lower bound
    @param x1: initial upper bound
    @param SEEK: Value to be found
    @param TOL: Error tolerance
    @param f: The function that best describes the system 
    @param MAX_ITER: Maximum number of operations allowed before convergence
    @param debug: Flag for exporting the results, returns a pandas dataframe with all variables described in the classical version of the algorithm
    """

    cond = True
    iter = 1

    r_iter = []

    while (cond and iter <= MAX_ITER):
        slope = (f(x1) - f(x0))/(x1 - x0)
        x_next = x1 - (f(x1) - SEEK)/slope

        if debug:
            r_dict = dict()
            r_dict['iter'] = iter
            r_dict['x0'] = x0
            r_dict['x1'] = x1
            r_dict['f(x0)'] = f(x0)
            r_dict['f(x1)'] = f(x1)
            r_dict['slope'] = slope
            r_dict['x_next'] = x_next
            r_dict['f(x_next)'] = f(x_next)
            r_dict['error'] = f(x_next) - SEEK

            r_iter.append(r_dict)

        x0, x1 = x1, x_next

        cond = np.abs(f(x_next) - SEEK) > TOL
        iter += 1

    if debug:
        return pd.DataFrame(r_iter)

    return x_next


def mod_secant(x0: float,
               x1: float,
               SEEK: int,
               TOL: float,
               f: callable,
               MAX_ITER: int,
               debug=False):
    """
    # Description
    This implementation relies in the specific case of the Q versus I_ref curve. It calls the basic secant(**kwargs) method with same parameters

    # Parameters
    @param x0: initial lower bound
    @param x1: initial upper bound
    @param SEEK: Value to be found
    @param TOL: Error tolerance
    @param f: The function that best describes the system 
    @param MAX_TER: Maximum number of operations allowed before convergence
    @param debug: Flag for exporting the results, returns a pandas dataframe with all variables described in the classical version of the algorithm
    """
    if SEEK > 100:
        x0 = 0.8
        x1 = 1.0
    else:
        x0 = 0.0
        x1 = 0.6

    return secant(x0, x1, SEEK, TOL, f, MAX_ITER, debug)


def bisection(a: float,
              b: float,
              SEEK: int,
              TOL: float,
              f: callable,
              MAX_ITER: int,
              debug=False):
    """
    # Description
    Computes SEEK = f(x) for a given function and a given set of values using a modified version of the bissection method

    # Parameters
    @param a: initial lower bound
    @param b: initial upper bound
    @param SEEK: Value to be found
    @param TOL: Error tolerance
    @param f: The function that best describes the system 
    @param MAX_TER: Maximum number of operations allowed before convergence
    @param debug: Flag for exporting the results, returns a pandas dataframe with all variables described in the classical version of the algorithm

    # Warning
    This method in the current implementation either converges reasonably or does not converge at all. Currently the reasons are unknown
    """

    cond = True
    iter = 1
    r_iter = []
    while (cond and iter <= MAX_ITER):

        c = (a+b)/2
        f_c = f(c)

        cond = np.abs(f_c - SEEK) > TOL

        f_a = f(a)
        f_b = f(b)

        if debug:
            a_cp = a
            b_cp = b

        if f_a*f_c > 0:
            a = c
        else:
            b = c

        if debug:
            r_dict = dict()
            r_dict['iter'] = iter
            r_dict['a'] = a_cp
            r_dict['b'] = b_cp
            r_dict['c'] = c
            r_dict['f(a)'] = f_a
            r_dict['f(b)'] = f_b
            r_dict['f(c)'] = f_c
            r_dict['error'] = f_c - SEEK

            r_iter.append(r_dict)

        iter += 1

    if debug:
        return pd.DataFrame(r_iter)

    return c
