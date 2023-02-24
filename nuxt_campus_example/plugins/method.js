
import Vue from 'vue'

import { parseTime, resetForm, addDateRange, handleTree } from "@/utils/ruoyi";

Vue.prototype.handleTree = handleTree
Vue.prototype.parseTime = parseTime

import { handelTimeFormat,handleCampusUrl } from "@/utils/campus";

Vue.prototype.handelTimeFormat = handelTimeFormat
Vue.prototype.handleCampusUrl = handleCampusUrl