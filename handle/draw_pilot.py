import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd


def draw_plot(data, labels, cluster_centers):
    df = pd.DataFrame({'Data': data.flatten(), 'Cluster': labels})
    # Vẽ histogram cho từng cụm
    plt.figure(figsize=(10, 6))
    sns.histplot(data=df, x='Data', hue='Cluster',
                 bins=30, kde=True, palette='viridis')
    plt.title('Phân phối dữ liệu và cụm')
    plt.xlabel('Dữ liệu')
    plt.ylabel('Số lượng')
    plt.legend(title='Cluster')
    plt.show()
