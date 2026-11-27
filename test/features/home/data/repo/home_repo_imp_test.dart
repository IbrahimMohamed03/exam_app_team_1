import 'package:exam_app_team_1/config/base_response/base_rsponse.dart';
import 'package:exam_app_team_1/config/entities/subject_entity.dart';
import 'package:exam_app_team_1/config/models/metadata_model.dart';
import 'package:exam_app_team_1/features/home/subject/api/data_sources/home_data_source_impl.dart';
import 'package:exam_app_team_1/features/home/subject/data/models/responses/subject_response.dart';
import 'package:exam_app_team_1/features/home/subject/data/repositories/home_repository_impl.dart';
import 'package:exam_app_team_1/features/home/subject_exams/data/models/subject.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_repo_imp_test.mocks.dart';

@GenerateMocks([HomeDataSourceImp])
void main() {
  late HomeRepositoryImpl homeRepositoryImpl;
  late MockHomeDataSourceImp mockHomeDataSourceImp;

  SubjectResponse dummyDTO = SubjectResponse(message: '',
    metadata: MetadataModel(
      currentPage: 1,
      numberOfPages: 1,
      limit: 10,
    ),
    subjects: [
      SubjectModel(id: '1',
          name: "JavaScript",
          icon: "",
          createdAt: DateTime(DateTime.monthsPerYear))
    ],
  );

  setUpAll(() {
    provideDummy<BaseResponse<SubjectResponse>>(
        SuccessBaseResponse<SubjectResponse>(dummyDTO));
    mockHomeDataSourceImp = MockHomeDataSourceImp();
    homeRepositoryImpl = HomeRepositoryImpl(mockHomeDataSourceImp);
  });


  test("home repo with success and data", () async {
    when(mockHomeDataSourceImp.getAllSubjects()).thenAnswer(
            (_) async => SuccessBaseResponse<SubjectResponse>(dummyDTO));

    BaseResponse<List<SubjectEntity>> result = await homeRepositoryImpl
        .getAllSubjects();
    expect(result, isA<SuccessBaseResponse<List<SubjectEntity>>>());
    expect((result as SuccessBaseResponse<List<SubjectEntity>>).data.length,
        dummyDTO.subjects.length);
    expect(result.data.first.name, dummyDTO.subjects.first.name);
  });


  test("home repo with error", () async{
    when(mockHomeDataSourceImp.getAllSubjects()).thenAnswer(
        (_)async=>ErrorBaseResponse<SubjectResponse>(errorObj: "something went wrong")
    );
    BaseResponse<List<SubjectEntity>> result = await homeRepositoryImpl
        .getAllSubjects();
    expect(result, isA<ErrorBaseResponse<List<SubjectEntity>>>());

    expect((result as ErrorBaseResponse<List<SubjectEntity>>).errorObj, "something went wrong");

  });


  test("home repo with success and empty list", () {

  });
}