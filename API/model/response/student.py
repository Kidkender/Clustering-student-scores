from flask_restx import fields

student_model = {
    'codeStudent': fields.Integer(attribute='MaHocSinh'),
    'nameStudent': fields.String(attribute='TenHocSinh'),
}
