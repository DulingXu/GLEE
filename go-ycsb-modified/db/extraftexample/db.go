package extraftexample

import (
	"bytes"
	"context"
	"crypto/tls"
	"encoding/json"
	"fmt"
	"strings"
	"time"

	// clientv3 "go.etcd.io/etcd/client/v3"

	"github.com/magiconair/properties"
	// "go.etcd.io/etcd/client/pkg/v3/transport"

	"github.com/pingcap/go-ycsb/pkg/ycsb"
)

type extraftCreator struct{}

type extraftDB struct {
	p *properties.Properties
}

func init() {
	ycsb.RegisterDBCreator("extraft", extraftCreator{})
}

func (c extraftCreator) Create(p *properties.Properties) (ycsb.DB, error) {
	return &extraftDB{
		p: p
		}, nil
}

func (db * extraftDB) Close() error{
	return nil
}

func (db *extraftDB) InitThread(ctx context.Context, _ int, _ int) context.Context {
	return ctx
}

func (db *extraftDB) CleanupThread(_ context.Context) {
}
func getRowKey(table string, key string) string {
	return fmt.Sprintf("%s:%s", table, key)
}

// func (db *extraftDB) Read(ctx context.Context, table string, key string, _ []string) (map[string][]byte, error) {
// 	rkey := getRowKey(table, key)

// }