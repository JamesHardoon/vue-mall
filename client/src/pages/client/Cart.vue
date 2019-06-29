<template>
  <div class="Cart">
    <div v-if="orderList.length>0">
      <div class="cartTableHeader">
        <span>商品信息</span>
        <span>单价</span>
        <span>数量</span>
        <span>小计</span>
        <span>交易操作</span>
      </div>
      <ul class="orderList">
        <li v-for="(item,index) in orderList" :key="'order'+item.id">
          <div class="orderDetail">
            <img :src="item.goods.img" alt="商品图片" />
            <div class="goodsName">
              <p @click="navTo('/mall/goods/'+item.goods.id)">{{item.goods.name}}</p>
              <span>{{item.goods.spec}}</span>
            </div>
            <span class="unitPrice">{{'￥'+item.goods.unitPrice}}</span>
            <span class="num">
              <NumberInput 
                @changeHandle="numberChange(item.id)" 
                :initNum="item.temGoodsNum" 
                v-model="item.temGoodsNum" 
                :min="1" 
                :max="999"
              />
            </span>
            <!-- <input @change="numberChange(item.id)" type="text" v-model="item.temGoodsNum" min="1" class="numInput" /> -->
            <span class="amount">{{'￥'+item.amount}}</span>
            <button @click="deleteOrder(item.id)">删除</button>
          </div>
        </li>
      </ul>
      <div class="cartFooter">
        <span>应付金额：</span>
        <span class="total">{{'￥'+totalAmount}}</span>
        <button @click="settleAccounts">下单</button>
      </div>
    </div>
    <p class="emptyTips" v-else>购物车还是空滴~</p>
  </div>
</template>

<script>
// 引入store中state的clientToken状态,即用户的登录状态
import { mapState } from 'vuex';
// 引入的接口: 获取用户订单列表、删除订单、结算购物车
import {getOrderByState,deleteOrder,settleAccounts} from '../../api/client';
// 商品数量增减组件
import NumberInput from '../../components/NumberInput';

export default {
  name: 'Cart',
  components:{
    NumberInput
  },
  computed:{  // 监控数据的变化
    ...mapState([
      'clientToken'
    ]),
    totalAmount(){  // 商品的总价
      let amount = 0;
      this.orderList.map((item,index)=>{
        amount+=item.amount;
      })
      return amount;
    }
  },
  data () {
    return {
      orderList:[],  // 从getOrderByState接口中读取到的数据存放在这个数组中
    }
  },

  methods:{
    getOrderByState(state){  // 获取用户订单列表,页面加载时,即执行此方法,在mounted中定义了,state为订单的状态(0:未付款,1:未发货,2:已发货,3:已到货)
      const res = getOrderByState(state,this.clientToken); // this.clientToken 表示当前用户的登录信息
      res
      .then((data)=>{
        this.orderList=data;
        this.orderList.map((item,index)=>{
          item.temGoodsNum = item.goodsNum;
        })
      })
      .catch((e)=>{
        console.log(e);
      })
    },
    numberChange(orderId){ // 商品数量增减
      this.orderList.map((item,index)=>{
        if(orderId===item.id){
          item.amount = item.temGoodsNum*item.goods.unitPrice;
      console.log(item.temGoodsNum,item.goods.unitPrice)
        }
      })
    },
    deleteOrder(orderId){  // 删除订单
      const res = deleteOrder(orderId);
      res
      .then(()=>{
        console.log('删除订单成功！');
        this.orderList.map((item,index)=>{
          if(item.id===orderId){
            this.orderList.splice(index,1);
          }
        })
      })
      .catch((e)=>{
        console.log(e);
      })
    },
    navTo(route){  // 点击购物车中相应商品的名称，跳转到商品对应的详情页
      this.$router.push(route);
    },
    settleAccounts(){  // 下单操作
      let cartList = [];
      this.orderList.map((item,index)=>{
        cartList.push({
          id:item.id,
          goodsNum:item.temGoodsNum,
          amount:item.amount
        })
      });
      const res = settleAccounts({
        cartList:cartList
      });
      res
      .then(()=>{
        alert('下单成功！');
        this.orderList = []; // 下单成功后情况购物车
      })
      .catch((e)=>{
        console.log(e);
      })
    }
  },

  mounted(){
    this.getOrderByState(0); // 0表示未付款
  },
}
</script>

<style scoped lang="less">
@import "../../assets/css/var.less";
.Cart{
  width: 100%;
  .emptyTips{
      width: 200px;
      text-align: center;
      display: block;
      margin: 30px auto;
      color:@thirdColor;
      font-size: 20px;
  }
  .cartTableHeader{
    width: 100%;
    height: 40px;
    background-color: #f5f5f5;
    border: 1px solid @borderColor;
    color: @fontDefaultColor;
    font-size: 14px;
    line-height: 40px;
    span{
      display: inline-block;
      width: 14%;
      &:first-child{
        width:40%;
        text-align: center;
      }
    }
  }
  .orderList{
    width: 100%;
    li{
      border: 1px solid @borderColor;
      border-top: none;
      font-size: 13px;
      .orderHeader{
        background-color: #f1f1f1;
        height: 40px;
        line-height: 40px;
        padding: 0 5px;
        .orderTime{
          font-weight: 600;
        }
        .orderId,.state{
          margin-left: 10px;
        }
      }
      .orderDetail{
        width: 100%;
        padding: 10px;
        position: relative;
        overflow: hidden;
        img{
          width: 84px;
          height: 84px;
          display: inline-block;
        }
        .goodsName{
          display: inline-block;
          margin-left: 5px;
          width: 230px;
          vertical-align: top;
          p{
            cursor: pointer;
            line-height: 20px;
            &:hover{
              text-decoration:underline;
            }
          }
          span{
            color:@fontDefaultColor;
            display: block;
            margin-top: 10px;
          }
        }
        .unitPrice,.num,.amount{
          display: inline-block;
          vertical-align: top;
          width: 15%;
          height: 85px;
          line-height: 85px;
          text-align: center;
        }
        .NumberInput{
          position: relative;
          top: 25px;
        }
        button{
          position: absolute;
          right: 90px;
          bottom: 40px;
          width: 70px;
          height: 30px;
          border-radius: 3px;
          background-color: @falseColor;
          color:white;
          border: none;

        }
      }
    }
  }
  .cartFooter{
    width: 100%;
    height: 60px;
    line-height: 60px;
    padding: 0 10px;
    border: 1px solid @borderColor;
    border-top: none;
    background-color: #f5f5f5;
    position: relative;
    span{
      color: @fontDefaultColor;
      display: inline-block;
      vertical-align: top;
    }
    .total{
      color:@falseColor;
      font-size: 25px;
      font-weight: 600;
    }
    button{
      position: absolute;
      right: 0;
      top: 0;
      width: 100px;
      height: 100%;
      background-color: @thirdColor;
      border: none;
      color:white;
      font-size: 20px;
    }
  }
}
</style>
