// Copyright 2017 The etcd Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package grpcproxy

import (
	"testing"
	"time"

	"go.etcd.io/etcd/clientv3"
	"go.etcd.io/etcd/clientv3/naming/endpoints"
	"go.etcd.io/etcd/integration"
	"go.etcd.io/etcd/pkg/testutil"
)

func TestRegister(t *testing.T) {
	defer testutil.AfterTest(t)

	clus := integration.NewClusterV3(t, &integration.ClusterConfig{Size: 1})
	defer clus.Terminate(t)
	cli := clus.Client(0)
	paddr := clus.Members[0].GRPCAddr()

	testPrefix := "test-name"
	wa := mustCreateWatcher(t, cli, testPrefix)

	donec := Register(cli, testPrefix, paddr, 5)

	ups := <-wa
	if len(ups) != 1 {
		t.Fatalf("len(ups) expected 1, got %d (%v)", len(ups), ups)
	}
	if ups[0].Endpoint.Addr != paddr {
		t.Fatalf("ups[0].Addr expected %q, got %q", paddr, ups[0].Endpoint.Addr)
	}

	cli.Close()
	clus.TakeClient(0)
	select {
	case <-donec:
	case <-time.After(5 * time.Second):
		t.Fatal("donec 'register' did not return in time")
	}
}

func mustCreateWatcher(t *testing.T, c *clientv3.Client, prefix string) endpoints.WatchChannel {
	em, err := endpoints.NewManager(c, prefix)
	if err != nil {
		t.Fatalf("failed to create endpoints.Manager: %v", err)
	}
	wc, err := em.NewWatchChannel(c.Ctx())
	if err != nil {
		t.Fatalf("failed to resolve %q (%v)", prefix, err)
	}
	return wc
}
