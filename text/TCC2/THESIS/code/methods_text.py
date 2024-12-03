import numpy as np

def secant(a: float,
           b: float,
           SEEK: int,
           TOL: float,
           f: callable,
           MAX_ITER: int,
           ):
    """
    # Description
    Computes SEEK = f(x) for a given function and a given set of values using a modified version of the secant method

    # Parameters
    @param a: initial lower bound
    @param b: initial upper bound
    @param SEEK: Value to be found
    @param TOL: Error tolerance
    @param f: The function that best describes the system 
    @param MAX_ITER: Maximum number of operations allowed before convergence
    """

    converged = False
    iter = 1

    while (not converged and iter <= MAX_ITER):
        slope = (f(b) - f(a))/(b - a)
        c = b - (f(b) - SEEK)/slope

        a, b = b, c

        converged = not (np.abs(f(c) - SEEK) > TOL)
        iter += 1

    return c


def mod_secant(a: float,
               b: float,
               SEEK: int,
               TOL: float,
               f: callable,
               MAX_ITER: int,
               alpha: float,
               beta: float,
               gamma: float
               ):
    """
    # Description
    This implementation relies in the specific case of the Q versus I_ref curve. It calls the basic secant(**kwargs) method with same parameters but improved region selection

    # Parameters
    @param a: initial lower bound in linear region
    @param b: initial upper bound
    @param SEEK: Value to be found
    @param TOL: Error tolerance
    @param f: The function that best describes the system 
    @param MAX_TER: Maximum number of operations allowed before convergence
    @param alpha: linear region upper bound
    @param beta: non-linear region lower bound
    @param: gamma: Q_d theshold
    """
    # Q (SEEK) is in nonlinear region
    if SEEK > gamma * SEEK:
        a = beta
        b = 1.0
    ## Q (SEEK) is in linear region
    else:
        a = 0.0
        b = alpha

    return secant(a, b, SEEK, TOL, f, MAX_ITER)


def bisection(a: float,
              b: float,
              SEEK: int,
              TOL: float,
              f: callable,
              MAX_ITER: int,
              ):
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
    """

    converged = False
    iter = 1

    while (not converged and iter <= MAX_ITER):

        c = (a+b)/2
        f_c = f(c)

        if np.abs(SEEK - f_c) <= TOL:
            converged = True
        elif (SEEK - f_c) > 0:
            a = c
        elif (SEEK - f_c) < 0:
            b = c
        else:
            converged = True

        iter += 1

    return c
