import numpy as np
from sklearn.cluster import KMeans, DBSCAN, MeanShift, estimate_bandwidth
from database_queries import get_all_score_by_semester
from handle.draw_pilot import plot_3d_in_group, plot_relationship_columns
from io import BytesIO
import base64
import matplotlib.pyplot as plt


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

    """_summary_
    Cluster and visualzie score by semester
    """


def cluster_by_semester(semester, n_clusters=4):
    data = get_all_score_by_semester(semester)
    kmeans = KMeans(n_clusters=n_clusters, n_init=10)

    kmeans.fit(data)

    cluster_centers = kmeans.cluster_centers_
    cluster_centers_mean = np.mean(cluster_centers, axis=1)
    for i, center in enumerate(cluster_centers_mean):
        print(f"Cụm {i}: {center:.2f}")

    idx_sort = np.argsort(cluster_centers_mean)
    dict_sort = {idx_sort[3]: "Giỏi", idx_sort[2]: "Khá",
                 idx_sort[1]: "Trung Bình", idx_sort[0]: "Yếu"}
    print("\nĐiều này tương ứng:")
    for key, value in dict_sort.items():
        print(f"Cụm {key}: tương ứng với {value}")

    labels_org = kmeans.labels_
    labels = np.array(list(map(dict_sort.get, list(labels_org))))

    cluster_counts = [np.sum(labels_org == i) for i in range(n_clusters)]

    total_data_points = len(data)
    percentages = [count / total_data_points * 100 for count in cluster_counts]

    avg_scores = []

    min_avg_scores = []
    max_avg_scores = []
    for i in range(n_clusters):
        print(
            f"Cụm {i} có {cluster_counts[i]} phần tử ({percentages[i]:.2f}%)")

        cluster_data = data[labels_org == i]

        avg_score = np.mean(cluster_data)
        avg_scores.append(avg_score)

        min_score = np.min(cluster_data)
        max_score = np.max(cluster_data)

        min_avg_scores.append(min_score)
        max_avg_scores.append(max_score)

    min_avg = np.min(min_avg_scores)
    max_avg = np.max(max_avg_scores)

    pair_plot_toan, pair_plot_sinh = plot_relationship_columns(data, labels)
    plot_3d_group_A00 = plot_3d_in_group(data, labels, "A00")
    plot_3d_group_A01 = plot_3d_in_group(data, labels, "A01")
    plot_3d_group_C00 = plot_3d_in_group(data, labels, "C00")
    img_base64 = plot_to_base64(pair_plot_toan)
    img_base64_sinh = plot_to_base64(pair_plot_sinh)
    group_A00_base64 = plot_to_base64(plot_3d_group_A00)
    group_A01_base64 = plot_to_base64(plot_3d_group_A01)
    group_C00_base64 = plot_to_base64(plot_3d_group_C00)
    return img_base64, img_base64_sinh, group_A00_base64, group_A01_base64, group_C00_base64


def plot_to_base64(plot):
    img_buf = BytesIO()
    plot.savefig(img_buf, format='png')
    img_buf.seek(0)
    img_base64 = base64.b64encode(img_buf.getvalue()).decode('utf-8')
    return img_base64


def compare_model(data, n_clusters):
    data = np.array(data).reshape(-1, 1)

    kmeans = KMeans(n_clusters=n_clusters, n_init=10)
    kmeans_labels = kmeans.fit_predict(data)

    dbscan = DBSCAN(eps=1, min_samples=5)
    dbscan_labels = dbscan.fit_predict(data)

    bandwidth = estimate_bandwidth(data, quantile=0.2)
    meanshift = MeanShift(bandwidth=bandwidth)
    meanshift_labels = meanshift.fit_predict(data)

    return kmeans_labels, dbscan_labels, meanshift_labels


def visualize_comparison(semester, n_cluster):
    data = get_all_score_by_semester(semester)

    kmeans_labels, dbscan_labels, meanshift_labels = compare_model(
        data, n_cluster)
    plt.figure(figsize=(12, 6))

    plt.subplot(1, 3, 1)
    plt.scatter(data, kmeans_labels, c=kmeans_labels, cmap='viridis')
    plt.title('K-Means Clustering')
    plt.xlabel('Data')
    plt.ylabel('Cluster')

    plt.subplot(1, 3, 2)
    plt.scatter(data, dbscan_labels, c=dbscan_labels, cmap='viridis')
    plt.title('DBSCAN Clustering')
    plt.xlabel('Data')
    plt.ylabel('Cluster')

    plt.subplot(1, 3, 3)
    plt.scatter(data, meanshift_labels, c=meanshift_labels, cmap='viridis')
    plt.title('Mean Shift Clustering')
    plt.xlabel('Data')
    plt.ylabel('Cluster')

    plt.tight_layout()

    return plot_to_base64(plt)
