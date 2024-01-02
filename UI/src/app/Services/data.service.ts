import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";

@Injectable({
  providedIn: 'root'
})

export class APIservicesService {
    baseApiUrl: string = environment.baseApiUrl;  
    
    constructor(private http: HttpClient) {
    }
  
    getAllStudent(): any {
      return this.http.get<any>(this.baseApiUrl + "/api/students")
    }
    
    getAllSubjectById(id: any): any {
      return this.http.get<any>(this.baseApiUrl + "/api/score/"+id)
    }

    getAllRateById(id: any): any {
      return this.http.get<any>(this.baseApiUrl + "/api/rate/"+id)
    }

    getAllTop5SubjectById(id: any, sem: any): any {
      return this.http.get<any>(this.baseApiUrl + "/api/get_Subject_From_Top5Avg?grade="+sem+"&student_code="+id)
    }

    getAllTop10GroupById(id: any, grade: any): any {
      return this.http.post<any>(this.baseApiUrl + "/api/create_group_subject_from_top5?student_code="+id+"&grade="+grade, id)
    }

    getGroupBy3Subject(id: any): any {
      return this.http.post<any>(this.baseApiUrl + "/api/reverse_group_subject?subjects="+id, id)
    }

    getFindGroupSubject(id:any, option: any) {
      return this.http.get<any>(this.baseApiUrl + "/api/find_group_subject?code_student="+id+"&option="+option)
    }

    getRecommendGroup(id:any, option: any) {
      return this.http.get<any>(this.baseApiUrl + "/api/recommend_group?code_student="+id+"&option="+option)
    }

    getScoreGroup(grade: any, group: any){
      return this.http.get<any>(this.baseApiUrl + "/api/get_Score_Group?group="+group+"&grade="+grade)
    }

    getScoreGroupBySemster(grade: any){
      return this.http.get<any>(this.baseApiUrl + "/api/scores/"+grade)
    }

    getClusterScoreSubjectSemester(subject : any, semester: any, n_cluster: any){
      return this.http.get<any>(this.baseApiUrl + "/api/score-subject-semester?subject="+subject+"&semester="+semester+"&n="+n_cluster)
    }

    getClusterScoreAVGSemester(semester: any, n_cluster: any){
      return this.http.get<any>(this.baseApiUrl + "/api/score_Avg_Semester?semester="+semester+"&n="+n_cluster)
    }

    getClusterScoreAVGYear(grade: any, n_cluster: any){
      return this.http.get<any>(this.baseApiUrl + "/api/score_Avg_year?grade="+grade+"&n="+n_cluster)
    }

    getCompareModel(semester: any, n_cluster: any ){
      return this.http.get<any>(this.baseApiUrl + "/api/compare-model?semester=" + semester+"&n="+n_cluster)
    }

    getDrawPilot(semester: any){
      return this.http.get<any>(this.baseApiUrl + "/api/draw-plot?semester="+semester)
    }
}