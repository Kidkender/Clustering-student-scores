import numpy as np
from sklearn.cluster import KMeans
from sklearn.cluster import DBSCAN


def cluster_data_kmean(data, n_clusters):
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

        min_avg_scores.append(min_score)
        max_avg_scores.append(max_score)

    min_avg = np.min(min_avg_scores)
    max_avg = np.max(max_avg_scores)

    cluster_centers = kmeans.cluster_centers_

    return cluster_centers, labels, data, cluster_counts


def cluster_data_dbScan(data, epsilon, min_samples):
    data = np.array(data).reshape(-1, 1)

    dbscan = DBSCAN(eps=epsilon, min_samples=min_samples)
    labels = dbscan.fit_predict(data)

    unique_labels = np.unique(labels)
    n_clusters = len(unique_labels) - (1 if -1 in labels else 0)

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

        min_avg_scores.append(min_score)
        max_avg_scores.append(max_score)

    min_avg = np.min(min_avg_scores)
    max_avg = np.max(max_avg_scores)

    return labels, data, cluster_counts
