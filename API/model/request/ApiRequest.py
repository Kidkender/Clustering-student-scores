from utils.semester_grade_util import is_grade_valid, is_semester_valid
from utils.subject_grade_utils import is_subject_valid
from utils.string_utils import isNull, check_parameters


class SubjectSemesterReq:
    def __init__(self, args):
        self.subject = is_subject_valid(args.get('subject'))
        self.semester = is_semester_valid(int(args.get('semester')))
        self.n_clusters = int(args.get('n'))

    def is_valid(self):
        return not any([isNull(self.subject), isNull(self.semester)])


class SubjectGradeReq:
    def __init__(self, args):
        self.subject = is_subject_valid(args.get('subject'))
        self.grade = is_grade_valid(int(args.get('grade')))
        self.n_clusters = int(args.get('n'))

    def is_valid(self):
        return not any([isNull(self.subject), isNull(self.grade)])


class SemesterClusterReq:
    def __init__(self, args):
        self.semester = is_semester_valid(int(args.get('semester')))
        self.n_clusters = int(args.get('n'))

    def is_valid(self):
        return not isNull(self.semester)


class GradeClusterReq:
    def __init__(self, args):
        self.grade = is_grade_valid(int(args.get('grade')))
        self.n_clusters = int(args.get('n'))

    def is_valid(self):
        return not isNull(self.grade)


class GradeGroupReq:
    def __init__(self, args):
        self.grade = is_grade_valid(int(args.get('grade')))
        self.group = args.get('group')

    def is_valid(self):
        return not any([isNull(self.grade), isNull(self.group)])


class GradeStudentReq:
    def __init__(self, args):
        self.grade = is_grade_valid(int(args.get('grade')))
        self.student_code = args.get('student_code')

    def is_valid(self):
        return not any([isNull(self.grade), isNull(self.student_code)])
