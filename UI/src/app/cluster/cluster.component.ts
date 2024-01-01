import { AfterViewInit, Component, ElementRef } from '@angular/core';
import { APIservicesService } from '../Services/data.service';
import { Chart } from 'chart.js/auto';

@Component({
  selector: 'app-cluster',
  templateUrl: './cluster.component.html',
  styleUrl: './cluster.component.scss'
})
export class ClusterComponent implements AfterViewInit {

  constructor(private service: APIservicesService, private elementRef: ElementRef, ) {

  }

  ngAfterViewInit(): void {
    setTimeout(() => { this.Init() }, 0)
  }

  Init() {
    this.service.getClusterScoreSubjectSemester(this.subject, this.semester, this.n_cluster)
    .subscribe({
      next: (re) => {
        const label = []
        for(let  i= 1; i<= this.n_cluster; i++)
          label.push(i)

          const cls : any = []
        re.result_cluster.cluster_centers.forEach(function (element: any) {
          cls.push(element[0])
        });

        this.createChart1(label, re.result_cluster.cluster_count, cls)
      } 
    })
  }

  subject: any = "toan"
  semester: any = 1
  n_cluster: any = 6
  public chart: any

  changeCluster(){
    this.service.getClusterScoreSubjectSemester(this.subject, this.semester, this.n_cluster)
    .subscribe({
      next: (re) => {
        const label = []
        for(let  i= 1; i<= this.n_cluster; i++)
          label.push(i)

        console.log(re)
        const cls : any = []
        re.result_cluster.cluster_centers.forEach(function (element: any) {
          cls.push(element[0])
        });

        this.createChart1(label, re.result_cluster.cluster_count, cls)
      } 
    })
  }

  createChart1(label: any, data: any,cluster: any){
    const DATA_COUNT = 7;
    const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};
    const labels = label;

    let chartStatus = Chart.getChart("Chart1"); // <canvas> id
    if (chartStatus != undefined) {
      chartStatus.destroy();
    }

    let htmlRef = this.elementRef.nativeElement.querySelector("#Chart1");
    this.chart = new Chart(htmlRef, {
      type: 'bar',

      data: {
        labels: labels,
        datasets: [
          {
            label: 'Số lượng học sinh',
            data: data,
            borderColor: ["purpose"],
            backgroundColor: ["orange"],
            order: 1
          },
          {
            label: 'Số lượng học sinh',
            data: data,
            borderColor: ["blue"],
            backgroundColor: ["green"],
            type: 'line',
            order: 0
          },
          {
            label: 'Tâm cụm',
            data: cluster,
            borderColor: ["pink"],
            backgroundColor: ["black"],
            type: 'line',
            order: 0
          },
        ]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: 'Số lượng học sinh ở các cụm'
          }
        }
      }
    })
  }
}
