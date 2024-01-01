import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from enumeration.subject import get_subject_values


def draw_to_subject(data, labels):
    df = pd.DataFrame({'Data': data.flatten(), 'Cluster': labels})

    plt.figure(figsize=(10, 6))
    sns.histplot(data=df, x='Data', hue='Cluster',
                 bins=30, kde=True, palette='viridis')
    plt.title('Phân phối dữ liệu và phân cụm ')

    plt.xlabel('Dữ liệu')
    plt.ylabel('Số lượng')
    plt.legend(title="Cluster")
    return plt


def plot_relationship_columns(data, labels):
    df = data.assign(Cluster=labels)

    pair_plot_toan = sns.pairplot(
        df.loc[:, ['Toan', 'Li', 'Hoa', 'Van', 'Ngoai_Ngu', 'Cluster']], hue='Cluster', height=2, diag_kind='kde')
    pair_plot_sinh = sns.pairplot(
        df.loc[:, ['Sinh', 'Su', 'Dia', 'GDCD', 'Cong_Nghe', 'Cluster']], hue='Cluster', height=2, diag_kind='kde')

    return pair_plot_toan, pair_plot_sinh


def plot_3d_in_group(data, labels, group):
    subjects = get_subject_values(group)
    fig = plt.figure(figsize=(12, 8))
    ax = fig.add_subplot(111, projection='3d')
    df = data.loc[:, subjects]
    df = df.assign(Cluster=labels)

    ax.scatter(df[df['Cluster'] == "Giỏi"][subjects[0]], df[df['Cluster'] == "Giỏi"][subjects[1]],
               df[df['Cluster'] == "Giỏi"][subjects[2]], s=100, c='blue', marker='o', label="Giỏi")
    ax.scatter(df[df['Cluster'] == "Khá"][subjects[0]], df[df['Cluster'] == "Khá"][subjects[1]],
               df[df['Cluster'] == "Khá"][subjects[2]], s=100, c='orange', marker='o', label="Khá")
    ax.scatter(df[df['Cluster'] == "Trung Bình"][subjects[0]], df[df['Cluster'] == "Trung Bình"][subjects[1]],
               df[df['Cluster'] == "Trung Bình"][subjects[2]], s=100, c='green', marker='o', label="Trung Bình")
    ax.scatter(df[df['Cluster'] == "Yếu"][subjects[0]], df[df['Cluster'] == "Yếu"][subjects[1]],
               df[df['Cluster'] == "Yếu"][subjects[2]], s=100, c='red', marker='o', label="Yếu")

    ax.set_xlabel(subjects[0])
    ax.set_ylabel(subjects[1])
    ax.set_zlabel(subjects[2])

    ax.set_title("3D Điểm Khối " + group + " : " + str(subjects))

    ax.legend()

    return fig
