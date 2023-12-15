from typing import Any

from pydantic import BaseModel


class Score_Group(BaseModel):
    student_code: str
