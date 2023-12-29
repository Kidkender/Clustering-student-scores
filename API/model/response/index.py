class ApirResponse:
    def __init__(self, data, result_cluster=None):
        self.data = data
        self.result_cluster = result_cluster

    def to_dict_records(self):
        response_dict = {"data": self.data.to_dict(orient='records')}

        if self.result_cluster:
            response_dict["result_cluster"] = {
                "cluster_centers": self.result_cluster[0].tolist(),
                "labels": self.result_cluster[1].tolist(),
                "clustered_data": self.result_cluster[2].tolist(),
                "cluster_count": [int(x) for x in self.result_cluster[3]],
            }
        return response_dict

    def to_dict(self):
        response_dict = {"data": self.data.to_dict()}

        if self.result_cluster:
            response_dict["result_cluster"] = {
                "cluster_centers": self.result_cluster[0].tolist(),
                "labels": self.result_cluster[1].tolist(),
                "clustered_data": self.result_cluster[2].tolist(),
                "cluster_count":  [int(x) for x in self.result_cluster[3]]
            }
        return response_dict
