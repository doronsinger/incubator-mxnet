/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/*!
 *  Copyright (c) 2019 by Contributors
 * \file np_reduce_op_value.cu
 * \brief GPU Implementation of reduce functions based on value.
 */
#include "np_broadcast_reduce_op.h"

namespace mxnet {
namespace op {
NNVM_REGISTER_OP(_np_sum)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesCompute<gpu, mshadow_op::sum, true>);

NNVM_REGISTER_OP(_backward_np_sum)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesBackwardUseNone<gpu>);

NNVM_REGISTER_OP(_np_max)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesNoDTypeCompute<gpu, mshadow::red::maximum>);

NNVM_REGISTER_OP(_backward_np_max)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesNoDTypeBackward<gpu, mshadow_op::eq>);

NNVM_REGISTER_OP(_np_min)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesNoDTypeCompute<gpu, mshadow::red::minimum>);

NNVM_REGISTER_OP(_backward_np_min)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesNoDTypeBackward<gpu, mshadow_op::eq>);

NNVM_REGISTER_OP(_np_prod)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesCompute<gpu, mshadow_op::product, true>);

NNVM_REGISTER_OP(_backward_np_prod)
.set_attr<FCompute>("FCompute<gpu>", NumpyReduceAxesBackwardUseInOut<gpu, mshadow_op::rdiv>);

NNVM_REGISTER_OP(_np_broadcast_to)
.set_attr<FCompute>("FCompute<gpu>", NumpyBroadcastToForward<gpu>);

NNVM_REGISTER_OP(_backward_np_broadcast_to)
.set_attr<FCompute>("FCompute<gpu>", NumpyBroadcastToBackward<gpu>);

}  // namespace op
}  // namespace mxnet
