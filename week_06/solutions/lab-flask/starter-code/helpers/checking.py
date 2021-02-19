def check_mandatory(args,mandatory):
    for k in mandatory:
        if k not in args.keys():
            return False
    return True