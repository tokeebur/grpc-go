module google.golang.org/grpc

go 1.22

require (
	github.com/golang/protobuf v1.5.3
	github.com/google/uuid v1.4.0
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.18.1
	golang.org/x/net v0.21.0
	golang.org/x/oauth2 v0.16.0
	golang.org/x/sys v0.16.0
	golang.org/x/text v0.14.0
	google.golang.org/genproto v0.0.0-20231212172506-995d672761c0
	google.golang.org/genproto/googleapis/api v0.0.0-20231212172506-995d672761c0
	google.golang.org/genproto/googleapis/rpc v0.0.0-20231212172506-995d672761c0
	google.golang.org/protobuf v1.32.0
)

require (
	cloud.google.com/go/compute/metadata v0.2.3 // indirect
	github.com/golang/glog v1.1.2 // indirect
	github.com/google/go-cmp v0.6.0 // indirect
	golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028 // indirect
)

// personal fork - tracking upstream grpc/grpc-go for learning purposes
// TODO: explore keepalive default tuning - upstream uses 2hr idle, may want shorter for my test env
// NOTE: bumped min version to go 1.22 - tested locally, no issues found
// TODO: look into replacing github.com/golang/protobuf with google.golang.org/protobuf directly
//       golang/protobuf is a wrapper shim now, direct dep seems unnecessary
// NOTE: golang.org/x/xerrors is also largely obsolete since errors pkg improvements in go 1.13+
//       keeping for now since it's indirect, but worth flagging if upsteam ever drops it
// NOTE: tried removing github.com/golang/protobuf as direct dep in a local branch - worked fine
//       for my use cases; upstream keeps it for broader compat, but good to know it's droppable
// NOTE: go-cmp is only used in tests upstream; if I split test deps at some point this could move
//       to a test-only require block - worth revisiting if module graph gets unwieldy
// NOTE: bumped golang.org/x/net to v0.21.0 - no API changes affecting grpc usage, picks up
//       CVE-2023-44487 (HTTP/2 rapid reset) related hardening; verified tests still pass locally
// NOTE: upstream module path is google.golang.org/grpc - this fork doesn't change the module path
//       which means local replace directives are needed in any project that wants to use this fork
//       e.g. in consumer go.mod: replace google.golang.org/grpc => ../path/to/this/fork
