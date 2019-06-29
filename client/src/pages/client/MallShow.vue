<template>
  <div class="MallShow">
    <FixedNav v-show="navShouldFixed">
      <div slot="navContent" class="container fixedNavContainer">
        <h3 class="fixedLeft" @click="navTo('/mall/show/index')">D-Mall</h3>
        <ul class="fixedRight">
          <li 
            v-for="(item,index) in typeList" 
            :key="'type'+item.id" 
            :class="{selected:judgeCurPath(item.id)}"
            @click="selectType(item.id)"
          >
            {{item.name}}
          </li>
        </ul>
      </div>
    </FixedNav>
    <div class="logo">
      <!--积惠报图片-->
      <!--<img src="../../assets/img/jihuibaologo@3x 2.png" style='width: 67px;margin-top: 29px;position: absolute;left: 70px;'/>-->
      <!--<img src="#" style='width: 67px;margin-top: 29px;position: absolute;left: 70px;'/>-->
      <!--严选年货节gif动图-->
      <!--<img src="../../assets/img/index1.gif"/>-->
      <!--<img src="#"/>-->
      <div class="searchBox">
        <TipsInput
          placeholder="请输入商品关键字"
          :tips="tips"
          @tipsChosen="searchTip"
          ref="TipsInput"
          v-model="searchText"
        />
        <i class="iconfont icon-search" @click="searchConfirm"/>
      </div>
    </div>
    <ul ref="typeList" class="typeList">
      <li 
        v-for="(item,index) in typeList" 
        :key="'type'+item.id" 
        :class="{selected:judgeCurPath(item.id)}"
        @click="selectType(item.id)"
      >
        {{item.name}}
      </li>
    </ul>
    <router-view></router-view>
  </div>
</template>

<script>
import { getTypes, getGoodsList } from "../../api/client";
import TipsInput from "../../components/TipsInput";
import FixedNav from "../../components/FixedNav";

export default {
  name: "MallShow",
  components: {
    TipsInput,
    FixedNav
  },
  computed: {
    curPath() {
      return this.$route.path;
    }
  },
  data() {
    return {
      typeList: [],
      searchText: "",
      tips: ["aa", "bb", "cc"],
      navShouldFixed: false
    };
  },

  methods: {
    navTo(route) {
      this.$router.push(route);
    },
    judgeCurPath(typeId) {
      if (typeId === -1) {
        if (this.curPath.indexOf("/show/index") > -1) {
          return true;
        } else {
          return false;
        }
      } else {
        if (this.curPath.indexOf(`/show/goodsList/${typeId}`) > -1) {
          return true;
        } else {
          return false;
        }
      }
    },
    selectType(typeId) { // 判断搜索框的位置是首页还是商品类别
      //首页
      if (typeId === -1) {
        this.navTo("/mall/show/index");
      } else {
        this.navTo("/mall/show/goodsList/" + typeId + "/all");
      }
    },
    searchTip(tip) {
      alert(tip);
    },
    searchTextChange(text) {},
    searchConfirm() {  // 首页搜索
      if (this.searchText.trim().length <= 0) {
        alert("输入不能为空！");
        return;
      }
      this.navTo(`/mall/show/goodsList/0/${this.searchText}`);  // 跳转到相应的搜索内容部分
    },
    scrollHandle() {  // 首页  头部滚动一定距离后固定
      const top = this.$refs.typeList.getBoundingClientRect().top;
      //还未到顶
      if (top > 0) {
        this.navShouldFixed = false;
      } else {
        //已经到顶
        this.navShouldFixed = true;
      }
    }
  },

  mounted() {
    //获取数据
    const res = getTypes();
    res
      .then(data => {
        data.unshift({
          id: -1,
          name: "首页"
        });
        this.typeList = data;
      })
      .catch(e => {
        console.log(e);
      });

    //监听滚动事件
    document.addEventListener("scroll", this.scrollHandle, false);
  },

  destroyed() {
    document.removeEventListener("scroll", this.scrollHandle, false);
  },
  watch: {
    searchText(newVal, oldVal) {
      this.searchTextChange(newVal);
    }
  }
};
</script>

<style scoped lang="less">
@import "../../assets/css/var.less";
.MallShow {
  width: 100%;
  .logo {
    display: block;
    margin: 50px auto 50px;
    text-align: right;
    user-select: none;
    vertical-align: middle;
    /*img {*/
      /*display: inline-block;*/
      /*width: 33.3%;*/
      /*vertical-align: middle;*/
    /*}*/
    .searchBox {
      display: inline-block;
      width: 33.3%;
      vertical-align: middle;
      text-align: left;
      .TipsInput {
        margin-left: 30px;
      }
      .icon-search {
        font-size: 24px;
        font-weight: bold;
        color: @thirdColor;
        cursor: pointer;
        position: relative;
        top: 4px;
      }
    }
  }
  .typeList {
    width: 100%;
    text-align: center;
    background-color: white;
    li {
      display: inline-block;
      width: 60px;
      margin: 0 50px;
      text-align: center;
      height: 30px;
      line-height: 20px;
      font-weight: 600;
      font-size: 14px;
      cursor: pointer;
    }
    .selected {
      color: @thirdColor;
      border-bottom: 3px solid @thirdColor;
    }
  }
  .fixedNavContainer {
    text-align: left;
    .fixedLeft {
      display: inline-block;
      vertical-align: middle;
      width: 15%;
      height: 100%;
      font-size: 30px;
      color: @thirdColor;
      user-select: none;
      line-height: 64px;
      text-align: center;
      cursor: pointer;
    }
    .fixedRight {
      width: 70%;
      height: 100%;
      display: inline-block;
      vertical-align: middle;
      li {
        display: inline-block;
        width: 60px;
        margin: 0 30px;
        text-align: center;
        height: 30px;
        line-height: 20px;
        font-weight: 600;
        font-size: 14px;
        cursor: pointer;
        position: relative;
        top: 4px;
      }
      .selected {
        color: @thirdColor;
        border-bottom: 3px solid @thirdColor;
      }
    }
  }
}
</style>
