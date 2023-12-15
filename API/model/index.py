from pydantic import BaseModel
from typing import Any


class student(BaseModel):
    codeStudent: str
    nameStudent: str | None = None
