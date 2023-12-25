from flask_restx import fields

score_model = {
    "MaHocSinh": fields.String,
    "TenHocSinh": fields.String,
    "Toan": fields.Float,
    "Li": fields.Float,
    "Hoa": fields.Float,
    "Sinh": fields.Float,
    "Van": fields.Float,
    "Su": fields.Float,
    "Dia": fields.Float,
    "Ngoai_Ngu": fields.Float,
    "GDCD": fields.Float,
    "Cong_Nghe": fields.Float,
    "Ky": fields.Integer,
}
