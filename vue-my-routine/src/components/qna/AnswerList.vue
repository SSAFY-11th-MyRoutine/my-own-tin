<template>
  <div>
    <!-- 댓글 -->
    <div class="qna-detail-comment">
      <div class="count">댓글 {{ store.ansList.length }}개</div>
      <div class="qna-detail-comment-card" v-for="ans in store.ansList" :key="ans.id">
        <!-- 댓글 작성자 프로필 -->
        <div class="qna-detail-comment-profile">
          <img
            src="/src/assets/img/profile.png"
            class="qna-detail-comment-profile-pic"
          />
          <div class="qna-detail-comment-profile-name">{{ ans.writer }}</div>

          <div class="routine-tag" 
          style="background-color: #fae6b1;
                  color: #555;">
                  Lv.{{ ans.userLevel }}</div>
          <div class="routine-user-tag">{{ ans.userAge }}</div>
          <div class="routine-user-tag">남성</div>
          <!-- 답변 채택 버튼 (질문 작성자에게만 보임) -->
          <button class="routine-user-tag" v-if="checkQueWriter(ans)" @click="pickAnswer(ans)">채택</button>
          <!-- 답변 삭제 버튼 (답변 작성자에게만 보임) -->
          <div class="routine-user-tag" style="background-color: #FFA101;" v-else-if="checkAnsWriter(ans.userId)" @click="deleteAnswer(ans)">
            내댓글
          </div>
        </div>
        <!-- 댓글 내용 -->
        <div>
          <p class="qna-detail-comment-content">
            {{ ans.content }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { usePointmileStore } from "@/stores/pointmile";
import { useQnAStore } from "@/stores/qna";
import { defineProps, ref, watch } from "vue";

const store = useQnAStore();
const pointMileStore = usePointmileStore();

const props = defineProps({
  questionId: {
    type: Number,
    required: true,
  },
});

const answerList = ref([]);

const fetchAnswerList = async (questionId) => {
  try {
    const answerListData = await store.getAnsList(questionId);
    answerList.value = answerListData;
  } catch (error) {
    console.log(error);
  }
};

watch(
  () => props.questionId,
  async (newId) => {
    if (newId) {
      await fetchAnswerList(newId);
    }
  },
  { immediate: true }
);

// 해당 질문의 작성자인지 확인
const checkQueWriter = function (ans) {
  // ans의 questionId를 통해 질문 작성자 아이디 알아내기
  const question = store.question;
  const userId = question.userId;

  const loginUser = JSON.parse(sessionStorage.getItem("user"));
  if (loginUser && loginUser.id === userId) {
    console.log(true);
    return true;
  }
  return false;
};

// 해당 답변의 작성자인지 확인
const checkAnsWriter = function (userId) {
  const loginUser = JSON.parse(sessionStorage.getItem("user"));
  if (loginUser && loginUser.id === userId) {
    return true;
  }
  return false;
};

// 답변 채택 (질문 작성자 입장)
const pickAnswer = function (answer) {
  const updateAns = { ...answer, isPicked: 1 };

  store.updateAnswer(updateAns);

  // 답변자 채택 포인트 생성
  const point = {
    userId: answer.userId,
    amount: 500,
    record: "답변 채택",
  };

  // 질문자 채택 포인트 생성
  const question = store.question;
  const userId = question.userId;
  const point2 = {
    userId: userId,
    amount: 300,
    record: "질문 답변 채택 완료",
  }

  pointMileStore.createPoint(point);
  pointMileStore.createPoint(point2);
};

// 답변 삭제 (답변 작성자 입장)
const deleteAnswer = function (answer) {
  store.deleteAnswer(answer);
};
</script>

<style scoped>
.qna-detail-comment {
  /* border-top: 2px solid #777; */
  margin-top: 20px;
  margin-bottom: 10px;
}
.qna-detail-comment .count {
  border-bottom: 1.5px solid #777;
  padding-bottom: 10px;
  padding-left: 10px;
  font-size: 1em;
  color: #31525b;
}

.qna-detail-comment-card {
  padding: 10px 15px;
  border-top: 1px solid #999;
}

.qna-detail-comment-profile {
  display: flex;
  align-items: center;
  /* padding: 10px 15px; */
}

.qna-detail-comment-profile-pic {
  width: 50px;
  height: 50px;
}

.qna-detail-comment-profile-name {
  font-weight: 600;
  padding: 0px 5px;
}

.qna-detail-comment-profile-level {
  font-size: 13px;
  padding: 3px 10px;
  margin: 0px 5px;
  background-color: #fae6b1;
  border-radius: 3px;
}

.qna-detail-comment-profile-tag {
  color: white;
  font-size: 13px;
  padding: 3px 10px;
  margin: 0px 5px;
  background-color: #aaa;
  border-radius: 3px;
}

.qna-detail-comment-content {
  font-size: 1rem;
  margin-top: 15px;
  margin-bottom: 15px;
}
</style>
