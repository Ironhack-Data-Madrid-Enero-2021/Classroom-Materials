def check_type(typ):
    def decorator(fn):
        def wrapper(*args):
            new_args = []
            for arg in args:
                new_args.append(typ(arg))
            return fn(*new_args)
        return wrapper
    return decorator
@check_type(int)
def suma(*args):
    return sum(args)