import numpy as np
from sklearn.cluster import KMeans


def cluster_data(data, n_clusters):
    data = np.array(data).reshape(-1, 1)
    kmeans = KMeans(n_clusters=n_clusters, n_init=10)
    kmeans.fit(data)
    labels = kmeans.labels_
    cluster_counts = [np.sum(labels == i) for i in range(n_clusters)]
    total_data_points = len(data)
    percentages = [count / total_data_points * 100 for count in cluster_counts]
    avg_scores = []
    min_avg_scores = []
    max_avg_scores = []

    for i in range(n_clusters):
        print(
            f"Cụm {i + 1} có {cluster_counts[i]} phần tử ({percentages[i]:.2f}%)")

        cluster_data = data[labels == i]

        avg_score = np.mean(cluster_data)
        avg_scores.append(avg_score)

        min_score = np.min(cluster_data)
        max_score = np.max(cluster_data)
        # print(f"Điểm thấp nhất: {min_score:.2f}")
        # print(f"Điểm cao nhất: {max_score:.2f}")
        # print(f"Điểm trung bình: {avg_score:.2f}")

        # Lưu trữ điểm thấp nhất và cao nhất
        min_avg_scores.append(min_score)
        max_avg_scores.append()

    min_avg = np.min(min_avg_scores)
    max_avg = np.max(max_avg_scores)
    print(f"\nĐiểm trung bình thấp nhất: {min_avg:.2f}")
    print(f"Điểm trung bình cao nhất: {max_avg:.2f}")
    print(f"Điểm trung bình của tất cả cụm: {np.mean(avg_scores):.2f}")

    # Điểm trung bình của từng cụm
    cluster_centers = kmeans.cluster_centers_
    # print("\nĐiểm trung bình của từng cụm:")
    # for i, center in enumerate(cluster_centers):
    #     print(f"Cụm {i + 1}: {center[0]:.2f}")

    return cluster_centers, labels, data
