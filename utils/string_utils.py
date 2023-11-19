
def isNull(data):
    if data is None:
        return True
    return False


def check_parameters(*params):
    if any(isNull(param) for param in params):
        return True
    return False
