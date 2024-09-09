<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
    <title>첫번째 페이지</title>  
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #eef2f5;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            gap: 20px;
        }

        .search-bar {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-bar input[type="text"] {
            flex: 1 1 60%;
            padding: 12px 20px;
            border: 1px solid #ccc;
            border-radius: 25px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s;
        }

        .search-bar input[type="text"]:focus {
            border-color: #ff8000;
        }

        .search-bar button {
            padding: 12px 25px;
            background-color: #ff8000;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .search-bar button:hover {
            background-color: #e67300;
        }

        .sidebar {
            width: 280px;
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .sidebar h3 {
            margin-top: 25px;
            font-size: 20px;
            margin-bottom: 15px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 8px;
            color: #333;
        }

        .sidebar .filter-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .sidebar button {
            flex: 1 1 45%;
            padding: 10px 15px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar button.active {
            background-color: #ff8000;
            color: white;
            border-color: #ff8000;
        }

        .sidebar .price-filter,
        .sidebar .range-filter {
            margin-top: 20px;
        }

        .sidebar input[type="range"] {
            width: 100%;
            margin: 10px 0;
        }

        .main-content {
            flex: 1;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }

        .product-item {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        .product-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .product-item img {
            width: 100%;
            height: 160px;
            object-fit: cover;
        }

        .product-content {
            padding: 15px;
        }

        .product-content .title {
            font-size: 18px;
            margin: 10px 0;
            font-weight: bold;
            color: #333;
        }

        .product-content .details {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }

        .badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: #ff5722;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }

            .search-bar {
                flex-direction: column;
            }

            .search-bar input[type="text"] {
                flex: 1 1 100%;
            }

            .search-bar button {
                flex: 1 1 48%;
            }
        }
    </style>
</head>
<body>
    <div id="app">
        <div class="container">
            <!-- 사이드바 -->
            <div class="sidebar">
                <h3>연령별</h3>
                <div class="filter-group">
                    <button @click="filterByAge('전체')" :class="{ active: activeFilters.age === '전체' }">전체</button>
                    <button @click="filterByAge('중딩')" :class="{ active: activeFilters.age === '중딩' }">중딩</button>
                    <button @click="filterByAge('고딩')" :class="{ active: activeFilters.age === '고딩' }">고딩</button>
                    <button @click="filterByAge('대딩')" :class="{ active: activeFilters.age === '대딩' }">대딩</button>
                    <button @click="filterByAge('성인')" :class="{ active: activeFilters.age === '성인' }">성인</button>
                </div>

                <h3>온라인/오프라인</h3>
                <div class="filter-group">
                    <button @click="filterByMode('전체')" :class="{ active: activeFilters.mode === '전체' }">전체</button>
                    <button @click="filterByMode('온라인')" :class="{ active: activeFilters.mode === '온라인' }">온라인</button>
                    <button @click="filterByMode('오프라인')" :class="{ active: activeFilters.mode === '오프라인' }">오프라인</button>
                    <button @click="filterByMode('혼합')" :class="{ active: activeFilters.mode === '혼합' }">혼합</button>
                </div>

                <h3>과목</h3>
                <div class="filter-group">
                    <button @click="filterBySubject('전체')" :class="{ active: activeFilters.subject === '전체' }">전체</button>
                    <button @click="filterBySubject('국어')" :class="{ active: activeFilters.subject === '국어' }">국어</button>
                    <button @click="filterBySubject('수학')" :class="{ active: activeFilters.subject === '수학' }">수학</button>
                    <button @click="filterBySubject('영어')" :class="{ active: activeFilters.subject === '영어' }">영어</button>
                    <button @click="filterBySubject('과학')" :class="{ active: activeFilters.subject === '과학' }">과학</button>
                    <button @click="filterBySubject('역사')" :class="{ active: activeFilters.subject === '역사' }">역사</button>
                    <button @click="filterBySubject('독서')" :class="{ active: activeFilters.subject === '독서' }">독서</button>
                    <button @click="filterBySubject('논술')" :class="{ active: activeFilters.subject === '논술' }">논술</button>
                    <button @click="filterBySubject('어학')" :class="{ active: activeFilters.subject === '어학' }">어학</button>
                    <button @click="filterBySubject('자격증')" :class="{ active: activeFilters.subject === '자격증' }">자격증</button>
                    <button @click="filterBySubject('프로젝트')" :class="{ active: activeFilters.subject === '프로젝트' }">프로젝트</button>
                    <button @click="filterBySubject('취업준비')" :class="{ active: activeFilters.subject === '취업준비' }">취업준비</button>
                </div>

                <h3>성별</h3>
                <div class="filter-group">
                    <button @click="filterByGender('전체')" :class="{ active: activeFilters.gender === '전체' }">전체</button>
                    <button @click="filterByGender('남자')" :class="{ active: activeFilters.gender === '남자' }">남자</button>
                    <button @click="filterByGender('여자')" :class="{ active: activeFilters.gender === '여자' }">여자</button>
                    <button @click="filterByGender('혼성')" :class="{ active: activeFilters.gender === '혼성' }">혼성</button>
                </div>

                <h3>참여자 수</h3>
                <div class="range-filter">
                    <input type="range" min="2" max="30" v-model="filters.participants" @input="filterStudies">
                    <p>{{ filters.participants }}명 이상</p>
                </div>

                <h3>참여기간</h3>
                <div class="range-filter">
                    <input type="range" min="1" max="180" v-model="filters.duration" @input="filterStudies">
                    <p>{{ filters.duration }}일 이상</p>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="main-content">
                <!-- 검색창 -->
                <div class="search-bar">
                    <input type="text" v-model="searchQuery" placeholder="검색어를 입력하세요" @keyup.enter="searchStudies">
                    <button @click="searchStudies">검색</button>
                    <button @click="registerStudy">스터디 등록</button>
                </div>

                <!-- 상품 목록 -->
                <div class="product-grid">
                    <div class="product-item" v-for="study in filteredStudies" :key="study.id" @click="viewStudy(study.id)">
                        <img :src="study.image" alt="스터디 이미지">
                        <div class="product-content">
                            <div class="title">{{ study.title }}</div>
                            <div class="details">{{ study.description }}</div>
                            <div class="details">{{ study.gender }} | 기간: {{ study.duration }}개월 | 인원 {{ study.currentParticipants }} / {{ study.maxParticipants }}</div>
                        </div>
                        <div class="badge">{{ study.mode }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Vue.js CDN -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    searchQuery: '',
                    activeFilters: {
                        age: '전체',
                        mode: '전체',
                        subject: '전체',
                        gender: '전체'
                    },
                    filters: {
                        participants: 2,
                        duration: 1
                    },
                    studies: [
                        {
                            id: 1,
                            title: '수학 [오프라인]',
                            description: '어디 근처 사시는 분 같이 시험공부해요',
                            gender: '여자만',
                            duration: 6,
                            currentParticipants: 2,
                            maxParticipants: 5,
                            mode: '오프라인',
                            image: 'https://via.placeholder.com/300x160?text=수학+스터디'
                        },
                        {
                            id: 2,
                            title: '영어 토론 [온라인]',
                            description: '매주 금요일 저녁 영어 토론 그룹',
                            gender: '남자만',
                            duration: 3,
                            currentParticipants: 5,
                            maxParticipants: 5,
                            mode: '온라인',
                            image: 'https://via.placeholder.com/300x160?text=영어+토론'
                        },
                        {
                            id: 3,
                            title: 'AI 프로그래밍 [혼합]',
                            description: 'AI 프로젝트 같이 하실 분 모집',
                            gender: '혼성',
                            duration: 5,
                            currentParticipants: 3,
                            maxParticipants: 5,
                            mode: '혼합',
                            image: 'https://via.placeholder.com/300x160?text=AI+프로그래밍'
                        },
                        // 추가 스터디 항목들...
                        {
                            id: 4,
                            title: '경제 스터디 [오프라인]',
                            description: '경제 토론 및 투자 관련 스터디 그룹',
                            gender: '혼성',
                            duration: 4,
                            currentParticipants: 2,
                            maxParticipants: 3,
                            mode: '오프라인',
                            image: 'https://via.placeholder.com/300x160?text=경제+스터디'
                        },
                        {
                            id: 5,
                            title: '역사 스터디 [온라인]',
                            description: '역사책 함께 읽고 토론해요',
                            gender: '혼성',
                            duration: 2,
                            currentParticipants: 7,
                            maxParticipants: 10,
                            mode: '온라인',
                            image: 'https://via.placeholder.com/300x160?text=역사+스터디'
                        },
                        {
                            id: 6,
                            title: '자격증 준비 [오프라인]',
                            description: 'IT 자격증 스터디 그룹 모집',
                            gender: '남자만',
                            duration: 6,
                            currentParticipants: 3,
                            maxParticipants: 15,
                            mode: '오프라인',
                            image: 'https://via.placeholder.com/300x160?text=자격증+준비'
                        },
                        {
                            id: 7,
                            title: '문학 읽기 [혼합]',
                            description: '문학 작품 읽고 생각 나누는 그룹',
                            gender: '여자만',
                            duration: 5,
                            currentParticipants: 1,
                            maxParticipants: 2,
                            mode: '혼합',
                            image: 'https://via.placeholder.com/300x160?text=문학+읽기'
                        },
                        {
                            id: 8,
                            title: '프로그래밍 기초 [온라인]',
                            description: '프로그래밍 기초 같이 공부하실분',
                            gender: '혼성',
                            duration: 3,
                            currentParticipants: 1,
                            maxParticipants: 2,
                            mode: '온라인',
                            image: 'https://via.placeholder.com/300x160?text=프로그래밍+기초'
                        },
                        {
                            id: 9,
                            title: '고등 국어 [오프라인]',
                            description: '고등 국어 문제 풀이 그룹',
                            gender: '여자만',
                            duration: 4,
                            currentParticipants: 3,
                            maxParticipants: 15,
                            mode: '오프라인',
                            image: 'https://via.placeholder.com/300x160?text=고등+국어'
                        },
                        {
                            id: 10,
                            title: '취업 준비 [혼합]',
                            description: '취업 스터디 그룹 모집',
                            gender: '혼성',
                            duration: 6,
                            currentParticipants: 7,
                            maxParticipants: 10,
                            mode: '혼합',
                            image: 'https://via.placeholder.com/300x160?text=취업+준비'
                        }
                    ]
                };
            },
            computed: {
                filteredStudies() {
                    return this.studies.filter(study => {
                        // 검색 필터
                        const matchesSearch = this.searchQuery === '' || 
                            study.title.includes(this.searchQuery) || 
                            study.description.includes(this.searchQuery);

                        // 연령 필터 (추가적인 데이터 필요)
                        // 예: study.age === this.activeFilters.age || this.activeFilters.age === '전체'

                        // 모드 필터
                        const matchesMode = this.activeFilters.mode === '전체' || study.mode === this.activeFilters.mode;

                        // 과목 필터 (추가적인 데이터 필요)
                        // 예: study.subject === this.activeFilters.subject || this.activeFilters.subject === '전체'

                        // 성별 필터
                        const matchesGender = this.activeFilters.gender === '전체' || study.gender === this.activeFilters.gender || 
                            (this.activeFilters.gender === '혼성' && study.gender === '혼성');

                        // 참여자 수 필터
                        const matchesParticipants = study.currentParticipants >= this.filters.participants;

                        // 참여 기간 필터
                        const matchesDuration = study.duration >= this.filters.duration;

                        return matchesSearch && matchesMode && matchesGender && matchesParticipants && matchesDuration;
                    });
                }
            },
            methods: {
                searchStudies() {
                    // 필터링은 computed 속성에서 자동으로 처리됩니다.
                },
                registerStudy() {
                    // 스터디 등록 페이지로 이동
                    window.location.href = "/StudyRegister.do";
                },
                viewStudy(id) {
                    // 특정 스터디 상세 페이지로 이동
                    window.location.href = `/StudyView.do?id=${id}`;
                },
                filterByAge(age) {
                    this.activeFilters.age = age;
                },
                filterByMode(mode) {
                    this.activeFilters.mode = mode;
                },
                filterBySubject(subject) {
                    this.activeFilters.subject = subject;
                },
                filterByGender(gender) {
                    this.activeFilters.gender = gender;
                },
                filterStudies() {
                    // 필터링은 computed 속성에서 자동으로 처리됩니다.
                }
            }
        });
        app.mount('#app');
    </script>
</body>
</html>
