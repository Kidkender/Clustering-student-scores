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
    this.service.getDrawPilot(this.semester3)
    .subscribe({
      next: (re) => {
        this.image1 = re.rel_cols_plot1
        this.image2 = re.rel_cols_plot2
        this.image3 = re.group_A00_plot
        this.image4 = re.group_A01_plot
        this.image5 = re.group_C00_plot
      }
    })

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

    this.service.getClusterScoreAVGSemester(this.semester2, this.n_cluster2)
    .subscribe({
      next: (re) => {
        const label = []
        for(let  i= 1; i<= this.n_cluster2; i++)
          label.push(i)

          const cls : any = []
        re.result_cluster.cluster_centers.forEach(function (element: any) {
          cls.push(element[0])
        });

        this.createChart2(label, re.result_cluster.cluster_count, cls)
      } 
    })

    this.service.getClusterScoreAVGYear(this.grade, this.n_cluster3)
    .subscribe({
      next: (re) => {
        const label = []
        for(let  i= 1; i<= this.n_cluster3; i++)
          label.push(i)

          const cls : any = []
        re.result_cluster.cluster_centers.forEach(function (element: any) {
          cls.push(element[0])
        });

        this.createChart3(label, re.result_cluster.cluster_count, cls)
      } 
    })
  }

  subject: any = "toan"
  semester: any = 1
  semester2: any = 1
  semester3: any = 1
  semester4: any = 1
  n_cluster: any = 6
  n_cluster2: any = 6
  n_cluster3: any = 6
  grade: any = 10
  public chart: any
  public chart2: any
  public chart3: any

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

  changeCluster2(){
    this.service.getClusterScoreAVGSemester(this.semester2, this.n_cluster2)
    .subscribe({
      next: (re) => {
        const label = []
        for(let  i= 1; i<= this.n_cluster2; i++)
          label.push(i)

          const cls : any = []
        re.result_cluster.cluster_centers.forEach(function (element: any) {
          cls.push(element[0])
        });

        this.createChart2(label, re.result_cluster.cluster_count, cls)
      } 
    })
  }

  changeCluster3(){
    this.service.getClusterScoreAVGYear(this.grade, this.n_cluster3)
    .subscribe({
      next: (re) => {
        const label = []
        for(let  i= 1; i<= this.n_cluster3; i++)
          label.push(i)

          const cls : any = []
        re.result_cluster.cluster_centers.forEach(function (element: any) {
          cls.push(element[0])
        });

        this.createChart3(label, re.result_cluster.cluster_count, cls)
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
            text: 'Phân cụm của môn học theo kì'
          }
        }
      }
    })
  }

  createChart2(label: any, data: any,cluster: any){
    const DATA_COUNT = 7;
    const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};
    const labels = label;

    let chartStatus = Chart.getChart("Chart2"); // <canvas> id
    if (chartStatus != undefined) {
      chartStatus.destroy();
    }

    let htmlRef = this.elementRef.nativeElement.querySelector("#Chart2");
    this.chart2 = new Chart(htmlRef, {
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
            text: 'Phân cụm điểm trung bình theo từng kì'
          }
        }
      }
    })
  }

  createChart3(label: any, data: any,cluster: any){
    const DATA_COUNT = 7;
    const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};
    const labels = label;

    let chartStatus = Chart.getChart("Chart3"); // <canvas> id
    if (chartStatus != undefined) {
      chartStatus.destroy();
    }

    let htmlRef = this.elementRef.nativeElement.querySelector("#Chart3");
    this.chart3 = new Chart(htmlRef, {
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
            text: 'Phân cụm điểm trung bình theo từng khối'
          }
        }
      }
    })
  }

  image1 = ''
  image2 = ''
  image3 = ''
  image4 = ''
  image5 = ''
  image6 = ''

  drawPilot(){
    this.service.getDrawPilot(this.semester3)
    .subscribe({
      next: (re) => {
        this.image1 = re.rel_cols_plot1
        this.image2 = re.rel_cols_plot2
        this.image3 = re.group_A00_plot
        this.image4 = re.group_A01_plot
        this.image5 = re.group_C00_plot
      }
    })
  }
}
