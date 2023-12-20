from flask_restx import fields

rate_model = {
    'DiemTongKet': fields.Float,
    'HanhKiem': fields.String,
    'HocLuc': fields.String,
    'Ky': fields.Integer,
    'MaHocSinh': fields.Integer,
    'TenHocSinh': fields.String,
}
