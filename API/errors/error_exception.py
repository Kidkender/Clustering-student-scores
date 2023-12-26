

class CustomException(Exception):
    def __init__(self, message, status_code):
        self.message = message
        self.status_code = status_code
        super().__init__(message)


class NoDataAvailableException(Exception):
    def __init__(self, message="No data available."):
        self.message = message
        super().__init__(message)


class DatabaseConnectionError(Exception):
    def __init__(self, message="Connect to database failed"):
        self.message = message
        super().__init__(self.message)
